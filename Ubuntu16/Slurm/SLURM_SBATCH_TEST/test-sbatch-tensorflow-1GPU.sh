#!/bin/bash

#SBATCH -J  tensor-1GPU                   # Job name
#SBATCH -o  out.test-tensorflow-1GPU.%j   # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  gpu                           # queue or partiton name
#SBATCH -t  01:30:00                      # Max Run time (hh:mm:ss) - 1.5 hours

#SBATCH --gres=gpu:1                      # Num Devices

python3   ~/TensorFlow-Examples/examples/5_DataManagement/tensorflow_dataset_api.py

# End of File.
