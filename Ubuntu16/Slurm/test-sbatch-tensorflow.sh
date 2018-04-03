#!/bin/sh

#SBATCH -J  nbody             # Job name
#SBATCH -o  test-nbody.%j     # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  gpu               # queue or partiton name
#SBATCH -t  01:30:00          # Max Run time (hh:mm:ss) - 1.5 hours
#SBATCH --nodelist=DataMining # node name
#SBATCH --gres=gpu:1          # Num Devices

python3   /root/TensorFlow-Examples/examples/5_DataManagement/tensorflow_dataset_api.py 

# End of File.
