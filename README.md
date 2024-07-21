# vcf-tajima
A pipeline to run Tajima D statistics on VCF using BED file

**Introduction**
**VCF to Tajima's D Analysis Pipeline**
This pipeline is designed to streamline the process of calculating Tajima's D from a VCF file using a BED file to specify target regions. The pipeline leverages GATK for variant selection and VCFkit for Tajima's D calculation. It is particularly useful for genomic researchers and bioinformaticians looking to analyze specific regions in a VCF file and obtain Tajima's D values efficiently.

**Features**
**Automated Processing:** Splits BED file into individual regions and processes each one.
**Variant Selection:** Uses GATK SelectVariants to extract variants for specified regions.
**Tajima's D Calculation:** Utilizes VCFkit to compute Tajima's D for each region.
**Custom Bin Size:** Allows for precise calculations based on the region sizes in the BED file.
**Output Management:** Combines results into a specified output file for easy analysis.

**Usage Manual**
**Prerequisites**
Before using the pipeline, ensure you have the following tools installed:

**GATK:** Genome Analysis Toolkit
**VCFkit:** A toolkit for processing VCF files
**awk:** A powerful text-processing language
**split:** A utility to split files into pieces

**Installation**
1. Clone the Repository
git clone https://github.com/xoaib4/vcf2tajima.git
cd vcf2tajima
2. Make the pipeline Executable
chmod +x vcf2tajima.sh

**Usage**
./vcf2tajima.sh targets.bed Reference.fasta variants.vcf names.args output.tajimaD

**Parameters**
**targets.bed:** Path to the BED file containing target regions.
**Reference.fasta:** Path to the reference FASTA file.
**variants.vcf:** Path to the VCF file with variants.
**names.args:** Path to the sample names arguments file.
**output.tajimaD:** Path to the output file where the Tajima's D results will be saved.

**Example**
./vcf2tajima.sh example_targets.bed example_reference.fasta example_variants.vcf example_names.args results.tajimaD

**Detailed Steps**
**Check Input Files: **The pipeline first verifies the existence of the input files.
**Create Temporary Directory:** It creates a temporary directory to store intermediate files.
**Split BED File:** The BED file is split into individual lines, each representing a region.
**Process Each Region:**
**Calculate Bin Size:** Determines the size of each region.
**Select Variants:** Extracts variants for each region using GATK SelectVariants.
**Calculate Tajima's D:** Runs VCFkit to calculate Tajima's D for each VCF file.
**Extract Target Regions:** Identifies the maximum value and extracts corresponding regions.
**Combine Results:** The results are concatenated into the specified output file.
**Clean Up:** Removes the temporary directory and intermediate files.

**Notes**
Ensure the input files are correctly formatted and paths are accurate.
The pipeline will print progress messages to the terminal for each major step.
Output files will be saved in the specified output file with the .tajimaD suffix.

**Citation**
If you use this pipeline in your research, please cite the following publication:

Akhtar, MS and Kawamura, S. 2024

**License**
This project is licensed under the MIT License. See the LICENSE file for details.

**Contributing**
Feel free to fork the repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

**Contact**
For questions or support, please open an issue in the GitHub repository. Developer can also be contacted at xoaib@ymail.com

