rule blastdb:
    output:
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
    log:
        "logs/blastdb/blastdb.log",
    conda:
        "../envs/conda_env.yaml"
    shell:
        """
        wget --wait 10 --random-wait -P resources/blastdb/ https://zenodo.org/records/8424777/files/silva_138.tar.gz &> {log}
        tar xvzf resources/blastdb/silva_138.tar.gz --directory resources/blastdb/ &>> {log}
        rm resources/blastdb/silva_138.tar.gz &>> {log}
        """
