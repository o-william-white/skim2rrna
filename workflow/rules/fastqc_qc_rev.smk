rule fastqc_qc_rev:
    input:
        "results/fastp/{sample}_R2.fastq.gz",
    output:
        html="results/fastqc_qc/{sample}_R2.html",
        zip="results/fastqc_qc/{sample}_R2_fastqc.zip",
    params:
        extra="--quiet",
    log:
        "logs/fastqc_qc/{sample}_R2.log",
    wrapper:
        "v7.5.0/bio/fastqc"
