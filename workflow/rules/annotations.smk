rule annotations:
    input: 
        "results/assembled_sequence/{sample}.ok"
    params:
        kingdom = barrnap_kingdom,
    output:
        ok = "results/annotations/{sample}/{sample}.ok"
    log:
        "logs/annotations/{sample}.log"
    conda:
        "../envs/annotations.yaml"
    shell:
        """
        FAS=$(echo results/assembled_sequence/{wildcards.sample}.fasta)
        if [ -e $FAS ]; then
            barrnap \
                --kingdom {params.kingdom} \
                --reject 0.1 \
                --outseq results/annotations/{wildcards.sample}/result.fas $FAS 1> results/annotations/{wildcards.sample}/result.gff 2> {log}
        else
                echo No assembled sequence for {wildcards.sample} > {log}
        fi
        touch {output.ok}
        """
