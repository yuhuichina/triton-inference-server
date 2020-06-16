#!/bin/bash 

# Copyright (c) 2020 NVIDIA CORPORATION. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

NV_VISIBLE_DEVICES=${NVIDIA_VISIBLE_DEVICES:-"0"}

# Start Triton server and mount prepared data from draco (Set $DRACO_PATH)
DRACO_PATH=$PWD/data

nvidia-docker run --rm -it \
   --shm-size=1g \
   --ulimit memlock=-1 \
   --ulimit stack=67108864 \
   -e NVIDIA_VISIBLE_DEVICES=$NVIDIA_VISIBLE_DEVICES \
   -v $DRACO_PATH:/data \
   gitlab-master.nvidia.com:5005/dl/joc/asr_kaldi:20.05-server-py3-devel 
