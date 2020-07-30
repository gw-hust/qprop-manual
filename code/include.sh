#!/usr/bin/env bash
# set qprop home
export QPROP_HOME="/srv/space/rigged"
export QPROP_DEP_DIR="$QPROP_HOME/dep"
# other settings
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$QPROP_DEP_DIR/openmpi/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$QPROP_DEP_DIR/gsl/lib

echo 'Usage: h1; h2; h3 num; h4 num。ne1; ne2; ne3 num; ne4 num。xe1; xe2; xe3 num; xe4 num'

h_bin=bin
ne_bin=bin-ne-2m
xe_bin=bin-xe-2m

##-----------H-------------##
h1() {
    "$QPROP_HOME/${h_bin}/imag-prop"
}

h2() {
    "$QPROP_HOME/${h_bin}/real-prop"
}

h3 () {
    [[ $1 ]] && num_p=$1 || num_p=8
    "$QPROP_DEP_DIR/openmpi/bin/mpiexec" -n $num_p "$QPROP_HOME/${h_bin}/ppp-mpi"
}
h4 () {
    [[ $1 ]] && num_p=$1 || num_p=8
    "$QPROP_DEP_DIR/openmpi/bin/mpiexec" -n $num_p "$QPROP_HOME/${h_bin}/eval-tsurff-mpi"
}
##-----------Ne------------##
ne1() {
    "$QPROP_HOME/${ne_bin}/imag-prop"
}

ne2() {
    "$QPROP_HOME/${ne_bin}/real-prop"
}

ne3 () {
    [[ $1 ]] && num_p=$1 || num_p=8
    "$QPROP_DEP_DIR/openmpi/bin/mpiexec" -n $num_p "$QPROP_HOME/${ne_bin}/ppp-mpi"
}
ne4 () {
    [[ $1 ]] && num_p=$1 || num_p=8
    "$QPROP_DEP_DIR/openmpi/bin/mpiexec" -n $num_p "$QPROP_HOME/${ne_bin}/eval-tsurff-mpi"
}
##-----------Xe------------##
xe1() {
    "$QPROP_HOME/${xe_bin}/imag-prop"
}

xe2() {
    "$QPROP_HOME/${xe_bin}/real-prop"
}

xe3 () {
    [[ $1 ]] && num_p=$1 || num_p=8
    "$QPROP_DEP_DIR/openmpi/bin/mpiexec" -n $num_p "$QPROP_HOME/${xe_bin}/ppp-mpi"
}
xe4 () {
    [[ $1 ]] && num_p=$1 || num_p=8
    "$QPROP_DEP_DIR/openmpi/bin/mpiexec" -n $num_p "$QPROP_HOME/${xe_bin}/eval-tsurff-mpi"
}
