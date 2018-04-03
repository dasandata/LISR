#!/bin/sh

#SBATCH -J  nbody             # Job name
#SBATCH -o  test-nbody.%j     # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  gpu               # queue or partiton name
#SBATCH -t  01:30:00          # Max Run time (hh:mm:ss) - 1.5 hours
#SBATCH --nodelist=DataMining # node name
#SBATCH --gres=gpu:1          # Num Devices

/root/NVIDIA_CUDA-8.0_Samples/bin/x86_64/linux/release/nbody -benchmark -numbodies=1024000 -numdevices=1

# End of File.
