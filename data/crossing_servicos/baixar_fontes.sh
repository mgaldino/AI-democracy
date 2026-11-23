#!/bin/sh
# Na raiz do repositório: sh data/crossing_servicos/baixar_fontes.sh
set -eu
cd "$(dirname "$0")"
mkdir -p raw

# Conserva os originais já presentes. Verifica a assinatura do arquivo antes
# de aceitar um download, inclusive quando o servidor devolve uma página HTML.
baixar() {
    url=$1
    destino=$2
    tipo=$3
    [ ! -s "$destino" ] || return 0
    curl --fail --location --silent --show-error --retry 2 --max-time 90 \
        --output "$destino.parcial" "$url"
    case "$tipo" in
        xlsx|zip) unzip -tq "$destino.parcial" >/dev/null ;;
        pdf) pdfinfo "$destino.parcial" >/dev/null ;;
    esac
    mv "$destino.parcial" "$destino"
}

for ano in 2012 2015 2025; do
    baixar "https://unionstats.com/ind/xls/ind_${ano}.xlsx" \
        "raw/unionstats_${ano}.xlsx" xlsx
done
baixar 'https://www.econometricsociety.org/publications/econometrica/browse/2023/01/01/The-Race-Between-Preferences-and-Technology/supp/ecta200523-sup-0001-onlineappendix.pdf' \
    raw/hubmer_2023_suplemento.pdf pdf
