#!/bin/bash
# FileName: autime.sh
# Author: rachpt
# Function: 计算指定波长持续光周期数对应的原子单位时间
#
if [[ $1 =~ [0-9]+ ]]; then
    # 计算
    unit=$(echo "scale=10;$1/(2.99792458*2.418884326)"|bc)
    [[ $2 =~ [0-9]+ ]] && result=$(echo "scale=10;$2 * $unit"|bc) || \
        result=$unit
    echo "原子单位时间：$result"
else
    echo '使用方法：参数1 激光波长 nm，参数2 cycle数量。'
fi
