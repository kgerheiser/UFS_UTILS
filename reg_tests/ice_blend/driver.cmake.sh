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

set -x

export DATA="@CMAKE_BINARY_DIR@"

#-----------------------------------------------------------------------------
# Should not have to change anything below.
#-----------------------------------------------------------------------------

export WGRIB=wgrib
export WGRIB2=wgrib2
export COPYGB=copygb
export COPYGB2=copygb2
export CNVGRIB=cnvgrib

export HOMEgfs=@CMAKE_SOURCE_DIR@
export HOMEreg=$HOMEgfs/data/ice_blend
export BLENDICEEXEC=@BLENDICEEXEC@

rm -fr $DATA

@CMAKE_CURRENT_SOURCE_DIR@/ice_blend.sh

exit 0
