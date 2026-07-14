process MERGE_COUNTS {

    tag "Merge count files"

    publishDir "${params.outdir}/counts", mode: "copy"


    input:
    path count_files


    output:
    path "gene_count_matrix.csv"


    script:

    """
    python3 - <<'PY'

import pandas as pd
import glob
import os


files = glob.glob("*_gene_counts.txt")

print("Files found:")
print(files)


matrix = None


for f in files:

    sample = os.path.basename(f).replace("_gene_counts.txt","")

    df = pd.read_csv(
        f,
        sep="\\t",
        comment="#"
    )


    df = df[["Geneid", df.columns[-1]]]


    df.columns = [
        "gene_id",
        sample
    ]


    if matrix is None:
        matrix=df
    else:
        matrix = matrix.merge(
            df,
            on="gene_id",
            how="outer"
        )


matrix.to_csv(
    "gene_count_matrix.csv",
    index=False
)

PY
    """
}
