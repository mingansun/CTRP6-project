STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P105_KO_1_1_val_1.fq.gz MFI_P105_KO_1_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P105_KO_1.  >MFI_P105_KO_1.log 2>MFI_P105_KO_1.err
samtools sort -@ 8 MFI_P105_KO_1.Aligned.out.bam >MFI_P105_KO_1.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P105_KO_2_1_val_1.fq.gz MFI_P105_KO_2_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P105_KO_2.  >MFI_P105_KO_2.log 2>MFI_P105_KO_2.err
samtools sort -@ 8 MFI_P105_KO_2.Aligned.out.bam >MFI_P105_KO_2.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P105_KO_3_1_val_1.fq.gz MFI_P105_KO_3_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P105_KO_3.  >MFI_P105_KO_3.log 2>MFI_P105_KO_3.err
samtools sort -@ 8 MFI_P105_KO_3.Aligned.out.bam >MFI_P105_KO_3.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P105_WT_1_1_val_1.fq.gz MFI_P105_WT_1_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P105_WT_1.  >MFI_P105_WT_1.log 2>MFI_P105_WT_1.err
samtools sort -@ 8 MFI_P105_WT_1.Aligned.out.bam >MFI_P105_WT_1.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P105_WT_2_1_val_1.fq.gz MFI_P105_WT_2_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P105_WT_2.  >MFI_P105_WT_2.log 2>MFI_P105_WT_2.err
samtools sort -@ 8 MFI_P105_WT_2.Aligned.out.bam >MFI_P105_WT_2.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P105_WT_3_1_val_1.fq.gz MFI_P105_WT_3_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P105_WT_3.  >MFI_P105_WT_3.log 2>MFI_P105_WT_3.err
samtools sort -@ 8 MFI_P105_WT_3.Aligned.out.bam >MFI_P105_WT_3.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P145_KO_1_1_val_1.fq.gz MFI_P145_KO_1_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P145_KO_1.  >MFI_P145_KO_1.log 2>MFI_P145_KO_1.err
samtools sort -@ 8 MFI_P145_KO_1.Aligned.out.bam >MFI_P145_KO_1.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P145_KO_2_1_val_1.fq.gz MFI_P145_KO_2_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P145_KO_2.  >MFI_P145_KO_2.log 2>MFI_P145_KO_2.err
samtools sort -@ 8 MFI_P145_KO_2.Aligned.out.bam >MFI_P145_KO_2.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P145_KO_3_1_val_1.fq.gz MFI_P145_KO_3_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P145_KO_3.  >MFI_P145_KO_3.log 2>MFI_P145_KO_3.err
samtools sort -@ 8 MFI_P145_KO_3.Aligned.out.bam >MFI_P145_KO_3.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P145_WT_1_1_val_1.fq.gz MFI_P145_WT_1_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P145_WT_1.  >MFI_P145_WT_1.log 2>MFI_P145_WT_1.err
samtools sort -@ 8 MFI_P145_WT_1.Aligned.out.bam >MFI_P145_WT_1.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P145_WT_2_1_val_1.fq.gz MFI_P145_WT_2_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P145_WT_2.  >MFI_P145_WT_2.log 2>MFI_P145_WT_2.err
samtools sort -@ 8 MFI_P145_WT_2.Aligned.out.bam >MFI_P145_WT_2.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P145_WT_3_1_val_1.fq.gz MFI_P145_WT_3_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P145_WT_3.  >MFI_P145_WT_3.log 2>MFI_P145_WT_3.err
samtools sort -@ 8 MFI_P145_WT_3.Aligned.out.bam >MFI_P145_WT_3.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P165_KO_1_1_val_1.fq.gz MFI_P165_KO_1_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P165_KO_1.  >MFI_P165_KO_1.log 2>MFI_P165_KO_1.err
samtools sort -@ 8 MFI_P165_KO_1.Aligned.out.bam >MFI_P165_KO_1.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P165_KO_2_1_val_1.fq.gz MFI_P165_KO_2_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P165_KO_2.  >MFI_P165_KO_2.log 2>MFI_P165_KO_2.err
samtools sort -@ 8 MFI_P165_KO_2.Aligned.out.bam >MFI_P165_KO_2.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P165_KO_3_1_val_1.fq.gz MFI_P165_KO_3_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P165_KO_3.  >MFI_P165_KO_3.log 2>MFI_P165_KO_3.err
samtools sort -@ 8 MFI_P165_KO_3.Aligned.out.bam >MFI_P165_KO_3.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P165_WT_1_1_val_1.fq.gz MFI_P165_WT_1_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P165_WT_1.  >MFI_P165_WT_1.log 2>MFI_P165_WT_1.err
samtools sort -@ 8 MFI_P165_WT_1.Aligned.out.bam >MFI_P165_WT_1.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P165_WT_2_1_val_1.fq.gz MFI_P165_WT_2_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P165_WT_2.  >MFI_P165_WT_2.log 2>MFI_P165_WT_2.err
samtools sort -@ 8 MFI_P165_WT_2.Aligned.out.bam >MFI_P165_WT_2.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P165_WT_3_1_val_1.fq.gz MFI_P165_WT_3_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P165_WT_3.  >MFI_P165_WT_3.log 2>MFI_P165_WT_3.err
samtools sort -@ 8 MFI_P165_WT_3.Aligned.out.bam >MFI_P165_WT_3.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P195_KO_1_1_val_1.fq.gz MFI_P195_KO_1_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P195_KO_1.  >MFI_P195_KO_1.log 2>MFI_P195_KO_1.err
samtools sort -@ 8 MFI_P195_KO_1.Aligned.out.bam >MFI_P195_KO_1.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P195_KO_2_1_val_1.fq.gz MFI_P195_KO_2_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P195_KO_2.  >MFI_P195_KO_2.log 2>MFI_P195_KO_2.err
samtools sort -@ 8 MFI_P195_KO_2.Aligned.out.bam >MFI_P195_KO_2.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P195_KO_3_1_val_1.fq.gz MFI_P195_KO_3_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P195_KO_3.  >MFI_P195_KO_3.log 2>MFI_P195_KO_3.err
samtools sort -@ 8 MFI_P195_KO_3.Aligned.out.bam >MFI_P195_KO_3.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P195_WT_1_1_val_1.fq.gz MFI_P195_WT_1_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P195_WT_1.  >MFI_P195_WT_1.log 2>MFI_P195_WT_1.err
samtools sort -@ 8 MFI_P195_WT_1.Aligned.out.bam >MFI_P195_WT_1.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P195_WT_2_1_val_1.fq.gz MFI_P195_WT_2_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P195_WT_2.  >MFI_P195_WT_2.log 2>MFI_P195_WT_2.err
samtools sort -@ 8 MFI_P195_WT_2.Aligned.out.bam >MFI_P195_WT_2.bam
STAR --runThreadN 8 --genomeDir ~/db/Index/STAR/GRCm38 --genomeLoad NoSharedMemory --readFilesCommand zcat --readFilesIn MFI_P195_WT_3_1_val_1.fq.gz MFI_P195_WT_3_2_val_2.fq.gz \
--outSAMtype BAM Unsorted --outStd SAM --outSAMattributes Standard --outSAMstrandField intronMotif --outSAMunmapped None \
--outFilterType BySJout outFilterIntronMotifs RemoveNoncanonical --outFileNamePrefix MFI_P195_WT_3.  >MFI_P195_WT_3.log 2>MFI_P195_WT_3.err
samtools sort -@ 8 MFI_P195_WT_3.Aligned.out.bam >MFI_P195_WT_3.bam
