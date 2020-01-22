#!/bin/bash

#SBATCH --job-name=e-gamf-sg
#SBATCH --output=log_evaluate_gamf_spherical.log
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=32GB
#SBATCH --time=7-00:00:00
# #SBATCH --gres=gpu:1

source activate ml
cd /scratch/jb6504/manifold-flow/experiments

python -u evaluate.py --modelname largebs --dataset spherical_gaussian --algorithm gamf --epsilon 0.01 --dropout 0 --dir /scratch/jb6504/manifold-flow
python -u evaluate.py --modelname largebs --dataset spherical_gaussian --algorithm gamf --epsilon 0.001 --dropout 0 --dir /scratch/jb6504/manifold-flow
python -u evaluate.py --modelname largebs --dataset spherical_gaussian --algorithm gamf --epsilon 0.1 --dropout 0 --dir /scratch/jb6504/manifold-flow

