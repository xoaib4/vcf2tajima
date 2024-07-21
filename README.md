# vcf2tajima
**VCF to Tajima's D Analysis Pipeline** <br>
A pipeline to run Tajima D statistics on VCF using BED file

**Introduction** <br>
This pipeline is designed to streamline the process of calculating Tajima's D from a VCF file using a BED file to specify target regions. The pipeline leverages GATK for variant selection and VCFkit for Tajima's D calculation. It is particularly useful for genomic researchers and bioinformaticians looking to analyze specific regions in a VCF file and obtain Tajima's D values efficiently. <br>
<br>
**Features** <br>
**Automated Processing:** Splits BED file into individual regions and processes each one. <br>
**Variant Selection:** Uses GATK SelectVariants to extract variants for specified regions. <br>
**Tajima's D Calculation:** Utilizes VCFkit to compute Tajima's D for each region. <br>
**Custom Bin Size:** Allows for precise calculations based on the region sizes in the BED file. <br>
**Output Management:** Combines results into a specified output file for easy analysis. <br>
<br>
**Usage Manual** <br>
**Prerequisites** <br>
Before using the pipeline, ensure you have the following tools installed: <br>
**GATK:** Genome Analysis Toolkit <br>
**VCFkit:** A toolkit for processing VCF files <br>
**awk:** A powerful text-processing language <br>
**split:** A utility to split files into pieces <br>
<br>
**Installation** <br>
1. Clone the Repository <br>
```
git clone https://github.com/xoaib4/vcf2tajima.git
cd vcf2tajima 
```
2. Make the pipeline Executable <br>
```
chmod +x vcf2tajima.sh
```

**Usage** <br>
To calculate Tajima's D on targeted capture sequencing on a Linux:
```
./vcf2tajima_target.sh targets.bed Reference.fasta variants.vcf names.args output.tajimaD
```
To calculate Tajima's D on whole genome sequencing on a Linux:
```
./vcf2tajima_wgs.sh targets.bed Reference.fasta variants.vcf names.args output.tajimaD
```
To calculate Tajima's D on targeted capture sequencing on a Mac:
```
./vcf2tajima_target_mac.sh targets.bed Reference.fasta variants.vcf names.args output.tajimaD
```
To calculate Tajima's D on whole genome sequencing on a Mac:
```
./vcf2tajima_wgs_mac.sh targets.bed Reference.fasta variants.vcf names.args output.tajimaD
```

**Parameters** <br>
**targets.bed:** Path to the BED file containing target regions. <br>
**Reference.fasta:** Path to the reference FASTA file. <br>
**variants.vcf:** Path to the VCF file with variants. <br>
**names.args:** Path to the sample names arguments file. <br>
**output.tajimaD:** Path to the output file where the Tajima's D results will be saved. <br>
<br>
**Example** <br>
```
./vcf2tajima.sh example_targets.bed example_reference.fasta example_variants.vcf example_names.args results.tajimaD
```

**Detailed Steps** <br>
**Check Input Files:** The pipeline first verifies the existence of the input files. <br>
**Create Temporary Directory:** It creates a temporary directory to store intermediate files. <br>
**Split BED File:** The BED file is split into individual lines, each representing a region. <br>
**Process Each Region:** <br>
**Calculate Bin Size:** Determines the size of each region. <br>
**Select Variants:** Extracts variants for each region using GATK SelectVariants. <br>
**Calculate Tajima's D:** Runs VCFkit to calculate Tajima's D for each VCF file. <br>
**Extract Target Regions:** Identifies the maximum value and extracts corresponding regions. <br>
**Combine Results:** The results are concatenated into the specified output file. <br>
**Clean Up:** Removes the temporary directory and intermediate files. <br>
<br>
**Notes** <br>
Ensure the input files are correctly formatted and paths are accurate. <br>
The pipeline will print progress messages to the terminal for each major step. <br>
Output files will be saved in the specified output file with the .tajimaD suffix. <br>
<br>
**Citation** <br>
If you use this pipeline in your research, please cite the following publication: <br>
<br>
Akhtar, M.S. and Kawamura, S., 2024. A protocol to extract a specific genomic region from a public whole-genome database and modify analytical bin length for population genetic studies. Methods and Protocols. <br>
Akhtar, M.S., Ashino, R., Oota, H., Ishida, H., Niimura, Y., Touhara, K., Melin, A.D. and Kawamura, S., 2022. Genetic variation of olfactory receptor gene family in a Japanese population. Anthropological Science, 130(2), pp.93-106. https://doi.org/10.1537/ase.211024
<br>
**License** <br>
This project is licensed under the MIT License. See the LICENSE file for details. <br>
<br>
**Contributing** <br>
Feel free to fork the repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change. <br>
<br>
**Contact** <br>
For questions or support, please open an issue in the GitHub repository. Developer can also be contacted at xoaib@ymail.com <br>

