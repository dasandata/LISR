#!/bin/bash

#SBATCH -J  test-sbatch-cpu           # Job name
#SBATCH -o  out.test-sbatch-cpu.%j    # Name of stdout output file (%j expands to %jobId)
#SBATCH -p  cpu                       # queue or partiton name
#SBATCH -t  01:30:00                  # Max Run time (hh:mm:ss) - 1.5 hours

#SBATCH -N 1 		# Total number of nodes requested
#SBATCH -n 4 		# Total number of mpi tasks #requested

/bin/hostname
/bin/pwd

/bin/date
/bin/sleep 10
/bin/date

# End of File.
