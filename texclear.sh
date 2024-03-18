#!/bin/bash

# List of TeX temporary file extensions
extensions=(
    "*.aux"
    "*.bbl"
    "*.blg"
    "*.fdb_latexmk"
    "*.fls"
    "*.log"
    "*.synctex*"
    "*.toc"
    "*.out"
    "*.lof"
    "*.lot"
    "*.idx"
    "*.ind"
    "*.ilg"
    "*.dvi"
    "*.nav"
    "*.snm"
    "*.vrb"
    "*.thm"
)

# Loop over the array and delete all files with the given extensions
for ext in "${extensions[@]}"; do
    find . -type f -name "$ext" -delete
done

echo "TeX temporary files have been deleted."