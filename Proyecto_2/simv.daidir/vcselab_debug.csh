#!/bin/csh -f

cd /mnt/vol_NFS_rh003/Est_Digitales_I_2024/BONILLA_BLANCO_I_2024_dig/Digitales_Ronny2024/Proyecto_2

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/mnt/vol_NFS_rh003/tools/vcs/R-2020.12-SP2/linux64/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

