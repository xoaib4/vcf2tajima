#!/bin/bash

# Usage: ./vcf2tajima_wgs.sh targets.bed Reference.fasta variants.vcf names.args

# Define input parameters
TARGETS_BED=$1
REFERENCE_FASTA=$2
VARIANTS_VCF=$3
NAMES_ARGS=$4

# Function to print usage
usage() {
    echo "Usage: $0 targets.bed Reference.fasta variants.vcf names.args"
    echo "  targets.bed  : Path to the BED file containing target regions"
    echo "  Reference.fasta : Path to the reference FASTA file"
    echo "  variants.vcf : Path to the VCF file with variants"
    echo "  names.args   : Path to the sample names arguments file"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 4 ]; then
    echo "Error: Incorrect number of arguments provided."
    usage
fi

# Check if the necessary files exist
if [ ! -f "$TARGETS_BED" ]; then
    echo "Error: $TARGETS_BED not found!"
    usage
fi

if [ ! -f "$REFERENCE_FASTA" ]; then
    echo "Error: $REFERENCE_FASTA not found!"
    usage
fi

if [ ! -f "$VARIANTS_VCF" ]; then
    echo "Error: $VARIANTS_VCF not found!"
    usage
fi

if [ ! -f "$NAMES_ARGS" ]; then
    echo "Error: $NAMES_ARGS not found!"
    usage
fi

# List files in the current directory 
ls

mkdir temp
cd temp

# Split BED file line by line, each output file contains one line from the input BED file
split -l 1 ../"$TARGETS_BED" --additional-suffix=.bed

# Loop through each split BED file
for i in *.bed; do
    echo "Processing BED file: $i"

    # Calculate bin size
    j=$(awk '{print $3 - $2 + 1}' "$i")
    echo "Bin size: $j"

    # Make a VCF for each BED file
    gatk SelectVariants -R ../"$REFERENCE_FASTA" -V ../"$VARIANTS_VCF" -L "$i" -O "$i.vcf" --exclude-filtered --exclude-non-variants --restrict-alleles-to BIALLELIC --sample-name ../"$NAMES_ARGS"

    # Loop through each VCF file
    for k in *.vcf; do
        echo "Processing VCF file: $k"

        # Run Tajima's D
        vk tajima "$j" 1 "$k" > "$i.tajima"

        # Extract target regions
        for l in *.tajima; do
            echo "Processing Tajima D file: $l"

            m=$(awk '{print $2}' "$i")
            n=$(awk '{print $3}' "$i")
            echo "m: $m"
            echo "n: $n"

            grep -w "$m" "$l" | grep -w "$n" > "${i}_cds.tajimaD"

            # List files 
            ls
            #rm *tmp.bed
        done
    done
done
