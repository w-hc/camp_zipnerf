
#!/bin/bash
# Script for training CamP on the 360 dataset.

export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7
# export CUDA_VISIBLE_DEVICES=0,


DATA_DIR=/share/data/pals/whc/nerfbln_dset/mipnerf360
CHECKPOINT_DIR=/scratch/whc/fastmap_poses
SCENE=garden

# python -m camp_zipnerf.train \
#     --gin_configs=configs/zipnerf/360.gin \
#     --gin_bindings="Config.data_dir = '${DATA_DIR}/${SCENE}'" \
#     --gin_bindings="Config.checkpoint_dir = '${CHECKPOINT_DIR}/${SCENE}'"


python -m camp_zipnerf.train \
    --gin_configs=configs/zipnerf/360.gin \
    --gin_configs=configs/camp/camera_optim.gin \
    --gin_bindings="Config.data_dir = '${DATA_DIR}/${SCENE}'" \
    --gin_bindings="Config.checkpoint_dir = '${CHECKPOINT_DIR}/${SCENE}'"


python -m camp_zipnerf.eval \
    --gin_configs=configs/zipnerf/360.gin \
    --gin_configs=configs/camp/camera_optim.gin \
    --gin_bindings="Config.data_dir = '${DATA_DIR}/${SCENE}'" \
    --gin_bindings="Config.checkpoint_dir = '${CHECKPOINT_DIR}/${SCENE}'"

