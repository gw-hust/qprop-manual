#!/usr/bin/env python3
# -*- encoding: utf-8 -*-
'''
@File    : run-all.py
@Time    : 2019/11/05 14:16:34
@Author  : rachpt
@Version : 0.3
@Contact : rachpt@126.com
@Desc    : 批量提交计算任务
           批量提交所有子文件夹任务，最大效率使用 CPU 资源
'''

import os, time
import threading
from time import sleep
# ------------------------------------------ #

PWD = '/srv/space/rigged/jobs/ne/Ne-电离率/'  # 计算任务父路径
cpus = 7  # 最多使用 CPU 核心数量
Prog = 'h'  # h, ne, xe。计算原子

INCLUDE = '/srv/space/rigged/include.sh'  # 前导文件路径

# ------------------------------------------ #
lst = os.listdir(PWD)
total = len(lst)


def call(dr):
    print('start task: ' + dr)
    _pwd = 'cd "' + PWD + '/' + dr + '" && source ' + INCLUDE + ' >/dev/null && '
    cmd = _pwd + Prog+'1 &>/dev/null && '+Prog+'2 &>/dev/null'
    os.system(cmd)
    # print(cmd)
    print('end task: ' + dr)


threads = {}
n = 0
for i in range(total):
    threads[i] = threading.Thread(target=call, args=(lst[n], ))
    n += 1

if __name__ == '__main__':
    n = 0
    print('开始时间：', time.asctime())
    start_time = time.time()
    while True:
        if threading.active_count() <= cpus:
            threads[n].start()
            n += 1
            if n >= total:
                break
        else:
            sleep(10)
    print("All submitted! Waitting last calc.")
    while True:
        if threading.active_count() == 1:
            print("Done！")
            end_time = time.time()
            print('结束时间：', time.asctime(), '\n耗时：{:.2f}分钟'.format(int(end_time-start_time)/60))
            break
        else:
            sleep(10)
