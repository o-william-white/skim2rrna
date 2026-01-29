rule fastqc_qc_fwd:
    input:
        "results/fastp/{sample}_R1.fastq.gz",
    output:
        html="results/fastqc_qc/{sample}_R1.html",
        zip="results/fastqc_qc/{sample}_R1_fastqc.zip",
    params:
        extra="--quiet",
    log:
        "logs/fastqc_qc/{sample}_R1.log",
    wrapper:
        "v7.5.0/bio/fastqc"
