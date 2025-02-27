
#!/bin/bash
# Script for training CamP on the 360 dataset.

export CUDA_VISIBLE_DEVICES=0,1

DATA_DIR=/scratch/sfm_workspace/mipnerf360
CHECKPOINT_DIR=/scratch/sfm_workspace/test
SCENE=bicycle

python -m camp_zipnerf.train \
    --gin_configs=configs/zipnerf/360.gin \
    --gin_bindings="Config.data_dir = '${DATA_DIR}/${SCENE}'" \
    --gin_bindings="Config.checkpoint_dir = '${CHECKPOINT_DIR}/${SCENE}'"


# python -m camp_zipnerf.train \
#     --gin_configs=configs/zipnerf/360.gin \
#     --gin_configs=configs/camp/camera_optim.gin \
#     --gin_bindings="Config.data_dir = '${DATA_DIR}/${SCENE}'" \
#     --gin_bindings="Config.checkpoint_dir = '${CHECKPOINT_DIR}/${SCENE}'"

