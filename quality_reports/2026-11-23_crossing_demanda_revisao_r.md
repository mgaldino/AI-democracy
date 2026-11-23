# Revisão independente do script de mudança estrutural e competição eleitoral

**Data** 23 de novembro de 2026. **Método** Leitura estática com a skill `review-r`, anterior à execução autorizada. **Arquivo** `model/verificar_crossing_demanda_ia.R`, confrontado com `model/mudanca_estrutural_ia_democracia.tex`. **Versão aprovada para reprodução** SHA-256 `ac8073abf44654443c3a83f2503862486d277b970141d169190b4ed8152f9b7d`.

**Veredito** Aprovado para execução numérica e geração das saídas. O autor corrigiu o rótulo da figura. A revisão examinou o fonte. A produção dos arquivos e sua inspeção visual cabem à etapa de execução.

## Correção do cálculo

- A participação em serviços resolve a equação (2) da nota. Para os parâmetros usados, o resíduo é estritamente crescente na participação e as extremidades enquadram a raiz para todo ponto positivo da malha. A implementação usa a solução exata no ponto inicial.
- A equação orçamentária com o consumo transformado constitui uma segunda implementação da demanda. O ramo homotético também é confrontado com sua expressão fechada. O erro de emprego verifica a transformação de quantidades em trabalho e a normalização contábil do modelo.
- A capacidade média dos dois setores, o custo mínimo da defesa, a margem sobre o limiar de dissuasão e a decomposição da diferença de capacidades reproduzem as expressões da nota. A tolerância absoluta de classificação é $10^{-10}$ em torno do empate. Os cenários substantivos são estritos. O valor crítico corresponde à indiferença da federação.
- A diferença de segunda ordem pela direita é apropriada no limite $a=0$. As fórmulas e testes distinguem a inversão da derivada local, o retorno da capacidade ao valor inicial após um choque finito e a mudança do desfecho político. O intervalo de capacidade dos serviços que inverte os sinais locais ordena os dois limites corretamente.
- A comparação com mobilização antecipada usa o ganho líquido do custo da proposta. O exercício de valor privado verifica que o custo efetivo da defesa fica de um só lado do suporte em cada cenário, o que preserva a decisão de todos os tipos.

## Arquivos e reprodutibilidade

O script usa R base e não precisa de aleatoriedade nem de pacotes adicionais. Os testes impedem a gravação quando falha alguma verificação prevista. A nota importa diretamente as três linhas da tabela em LaTeX. As cinco colunas estão na ordem correta, e a terceira saída registra os resultados numéricos em Markdown. Os diretórios de destino existem na raiz do repositório. O dispositivo vetorial `grDevices::pdf()` usa Helvetica e dispensa Cairo. O sistema local oferece `pt_BR.UTF-8` e `en_US.UTF-8` para executar o fonte com locale UTF-8, se necessário.

## Apresentação

O autor substituiu o rótulo original pela definição do parâmetro econômico, “Redução do trabalho por unidade de A”. A legenda da nota passou a identificar a faixa cinza como o intervalo em que as decisões institucionais divergem. O hash após reverter em memória apenas a mudança de rótulo reproduziu o hash da primeira versão revisada (`1cf91f40c5491cbb1b41c283f0951cc3234b185b4b87ee829a262348167b366b`).

Depois da renderização, o autor ajustou o metadado interno de título da figura PDF para “Demanda setorial e democracia”. A substituição inversa em memória reproduziu o hash da versão aprovada para a primeira execução (`9effede0a606d60804f9af9112d31c2b5e5ded69342118f290ebcb992175f040`). A versão atual está aprovada para a execução de reprodução.
