#!/bin/bash

#SBATCH -J  tensor-2GPU                   # Job name
#SBATCH -o  out.test-tensorflow-2GPU.%j   # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  gpu                           # queue or partiton name
#SBATCH -t  01:30:00                      # Max Run time (hh:mm:ss) - 1.5 hours

#SBATCH --gres=gpu:2                      # Num Devices

python3   ~/TensorFlow-Examples/examples/5_DataManagement/tensorflow_dataset_api.py
echo
python3 -V
which python3
which pip3
echo
pip3 list | grep tensorflow
echo
# End of File.
