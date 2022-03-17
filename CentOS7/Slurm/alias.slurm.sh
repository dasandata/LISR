# For Ubuntu 16.04 Standalon GPU Server alias config file.
# This file location is /etc/profile.d/alias.slurm.#!/bin/sh

alias sinfo='sinfo    -o "%20P %5D  %20C %14F %6t  %8z  %10m %10d %11l %16f %N   %G"     '
alias squeue='squeue  -o "%8i  %12j %4t  %10u %20q %20a %10g %20P %10Q %5D  %11l %11L %R"'

# End of file
