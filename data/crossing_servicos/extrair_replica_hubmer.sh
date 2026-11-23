#!/bin/sh
# Um caminho absoluto opcional pode apontar para uma cópia existente do ZIP.
set -eu
arquivo=${1:-${TMPDIR:-/tmp}/ia-dem-hubmer-18580-2022.zip}
cd "$(dirname "$0")"
mkdir -p raw/hubmer_replica
if [ ! -s "$arquivo" ]; then
    curl --fail --location --show-error --silent --retry 2 --max-time 600 \
        'https://www.econometricsociety.org/publications/econometrica/2023/01/01/The-Race-Between-Preferences-and-Technology/supp/18580_Data_and_Programs.zip' \
        --output "$arquivo.parcial"
    unzip -tq "$arquivo.parcial" >/dev/null
    mv "$arquivo.parcial" "$arquivo"
fi
for caminho in readme.txt code_estimation/2e_sum_2dig.do \
        data_interm/data_pcepfi1.dta data_interm/CEX/quantiles_expsh4.dta \
        output_est/TabB1_s2sumstats_adddlogesh.tex; do
    destino="raw/hubmer_replica/${caminho##*/}"
    unzip -p "$arquivo" "SUBMIT_code/$caminho" > "$destino.parcial"
    test -s "$destino.parcial"
    mv "$destino.parcial" "$destino"
done
