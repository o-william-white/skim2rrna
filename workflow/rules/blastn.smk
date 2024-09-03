rule blastn:
    input:
        multiext(
            "resources/blastdb/silva_138/silva_138",
            ".ndb",
            ".nhr",
            ".nin",
            ".njs",
            ".nog",
            ".nos",
            ".not",
            ".nsq",
            ".ntf",
            ".nto",
        ),
        fas="results/assembled_sequence/{sample}.fasta",
    output:
        "results/blastn/{sample}.txt",
    log:
        "logs/blastn/{sample}.log",
    conda:
        "../envs/blastn.yaml"
    shell:
        """
        blastn \
           -query {input.fas} \
           -db resources/blastdb/silva_138/silva_138 \
           -out {output} \
           -outfmt '6 qseqid staxids bitscore std' \
           -max_target_seqs 10 \
           -max_hsps 1 \
           -evalue 1e-25 &> {log}
        """
