#!/bin/bash

#SBATCH -J  nbody-2GPU              # Job name
#SBATCH -o  out.test-nbody-2GPU.%j  # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  gpu                     # queue or partiton name
#SBATCH -t  01:30:00                # Max Run time (hh:mm:ss) - 1.5 hours

#SBATCH --gres=gpu:2                # Num Devices

~/NVIDIA_CUDA-8.0_Samples/bin/x86_64/linux/release/nbody -benchmark -numbodies=1024000 -numdevices=2

# End of File.
