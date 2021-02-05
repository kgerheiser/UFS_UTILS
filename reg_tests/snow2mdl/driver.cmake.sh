#!/bin/bash

#-----------------------------------------------------------------------------
#
# Run snow2mdl regression test on Hera.
#
# Set $DATA to your working directory.  Set the project code (SBATCH -A)
# and queue (SBATCH -q) as appropriate.
#
# Invoke the script as follows:  sbatch $script
#
# Log output is placed in regression.log.  A summary is
# placed in summary.log
#
# The test fails when its output does not match the baseline file
# as determined by the 'cmp' command.  The baseline file is
# stored in HOMEreg.
#
#-----------------------------------------------------------------------------

#SBATCH -J snow
#SBATCH -A fv3-cpu
#SBATCH --open-mode=truncate
#SBATCH -o regression.log
#SBATCH -e regression.log
#SBATCH --ntasks=1
#SBATCH -q debug
#SBATCH -t 00:03:00

set -x

compiler=${compiler:-"intel"}

export DATA="@CMAKE_CURRENT_BINARY_DIR@"

#-----------------------------------------------------------------------------
# Should not have to change anything below.
#-----------------------------------------------------------------------------

rm -fr $DATA

export HOMEgfs=@CMAKE_SOURCE_DIR@
export HOMEreg=$HOMEgfs/data/snow2mdl
export WGRIB=wgrib
export WGRIB2=wgrib2
export SNOW2MDLEXEC=@SNOW2MDLEXEC@

@CMAKE_CURRENT_SOURCE_DIR@/snow2mdl.sh

exit 0
