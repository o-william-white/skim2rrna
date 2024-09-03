rule annotations:
    input:
        fasta="results/assembled_sequence/{sample}.fasta",
    params:
        kingdom=barrnap_kingdom,
    output:
        gff="results/annotations/{sample}/result.gff",
        fasta="results/annotations/{sample}/result.fasta",
    log:
        "logs/annotations/{sample}.log",
    conda:
        "../envs/annotations.yaml"
    shell:
        """
        barrnap \
           --kingdom {params.kingdom} \
           --reject 0.1 \
           --outseq {output.fasta} {input.fasta} 1> {output.gff} 2> {log}
        """
