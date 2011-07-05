# Switch between GPUs 
echo ON > /sys/kernel/debug/vgaswitcheroo/switch
# turns on GPU that is disconnected, not switch outputs
echo IGD > /sys/kernel/debug/vgaswitcheroo/switch
# connects integrated graphics with outputs
echo DIS > /sys/kernel/debug/vgaswitcheroo/switch
# connects discrete graphics with outputs
echo OFF > /sys/kernel/debug/vgaswitcheroo/switch

# in x -windows

# integrated
echo DIGD > /sys/kernel/debug/vgaswitcheroo/switch
# discrete graphics switch
echo IGD > /sys/kernel/debug/vgaswitcheroo/switch
