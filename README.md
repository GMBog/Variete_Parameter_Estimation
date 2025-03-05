# Parameter Estimation Codes for BLUPF90 and WOMBAT

This repository contains a variety of scripts and parameter estimation codes to be used with [BLUPF90]([https://nce.ads.uga.edu/wiki/doku.php?id=blupf90](https://nce.ads.uga.edu/wiki/doku.php?id=start)) and [WOMBAT](http://agtrilab.tamu.edu/wiki/doku.php?id=wombat). These tools are widely used for mixed model analyses in animal breeding and genetics.

## Overview
The scripts provided in this repository facilitate the estimation of genetic parameters using BLUPF90 and WOMBAT. They include:
- Data preparation scripts
- Model specification files
- Command-line execution scripts
- Post-processing utilities

These codes are designed to help users streamline parameter estimation workflows efficiently.

## Requirements
To use these scripts, you must have:
- **BLUPF90** suite installed ([installation guide](https://nce.ads.uga.edu/wiki/doku.php?id=download))
- **WOMBAT** installed ([download here](http://agtrilab.tamu.edu/wiki/doku.php?id=wombat))
- R (optional) for data preprocessing and post-processing
- Linux/Mac/Windows command-line interface

## File Structure
```
├── blupf90_scripts/
│   ├── prepare_data.R     # Prepares input data for BLUPF90
│   ├── run_blupf90.sh     # Example script to run BLUPF90
│   ├── blupf90.par        # Sample parameter file
│   └── post_process.R     # Extracts and formats results
│
├── wombat_scripts/
│   ├── prepare_data_wombat.R   # Prepares input data for WOMBAT
│   ├── run_wombat.sh           # Example script to run WOMBAT
│   ├── wombat.par              # Sample parameter file
│   └── post_process_wombat.R   # Extracts and formats results
│
└── README.md         # This file
```

## Usage
### BLUPF90
1. Run BLUPF90:
   ```sh
   sh blupf90_scripts/run_blupf90.sh
   ```
3. Post-process results:
   ```sh
   Rscript blupf90_scripts/post_process.R
   ```

### WOMBAT
1. Prepare data:
   ```sh
   Rscript wombat_scripts/prepare_data_wombat.R
   ```
2. Run WOMBAT:
   ```sh
   sh wombat_scripts/run_wombat.sh
   ```
3. Post-process results:
   ```sh
   Rscript wombat_scripts/post_process_wombat.R
   ```

## Citation
If you use these scripts in your research, please cite:
- **BLUPF90:** Misztal et al. (2002) "BLUPF90 – a flexible mixed model program."
- **WOMBAT:** Meyer (2007) "WOMBAT – A tool for mixed model analyses in quantitative genetics."

## Contributions
Contributions are welcome! Please submit a pull request with any improvements or additional scripts.

