# =============================================================================
# Sketch Numerico: Microfundamentacao via Populismo
# Jogo de dois equilibrios sob threshold automation
# Mecanismo: heterogeneidade de E + entrada autorreforçante de P-party
# =============================================================================

# --- Parametros do modelo base (v2) ---
w_E <- 1      # salario base expostos
W   <- 2      # output per capita total
L   <- 1      # magnitude do choque
theta <- 0.5  # fracao capturada por E sob R
k   <- 0.4    # custo de transicao
kappa_0 <- 0.8  # capacidade repressiva (autocracia)
eta_R <- 0.5    # efetividade repressiva sob rapid

# --- Derivados do modelo base ---
Delta <- theta * W - k - w_E   # = -0.4
phi_bar <- 1 - abs(Delta) / L  # = 0.6
kappa_bar <- L - abs(Delta)    # = 0.6

cat("=== Parametros do modelo base ===\n")
cat(sprintf("Delta     = %.2f\n", Delta))
cat(sprintf("phi_bar   = %.2f\n", phi_bar))
cat(sprintf("kappa_bar = %.2f\n", kappa_bar))
cat(sprintf("kappa_bar/eta_R = %.2f\n", kappa_bar / eta_R))

# --- Parametros do Appendix A (jogo de votacao) ---
gamma <- 0.8  # custo de instabilidade para N
c_tax <- 1.0  # custo por unidade de taxacao para N

cat("\n=== Appendix A: condicao original ===\n")
cat(sprintf("gamma = %.2f, phi_bar * c = %.2f\n", gamma, phi_bar * c_tax))
cat(sprintf("N compensa? %s (gamma >= phi_bar*c)\n",
            ifelse(gamma >= phi_bar * c_tax, "SIM", "NAO")))

# =============================================================================
# JOGO DE ELITES COM ENTRADA AUTORREFORÇANTE
# =============================================================================
#
# Jogadores:
#   E_i: continuo de trabalhadores expostos, votam individualmente
#   M-party: elites mainstream, oferecem compensacao
#   P-party: empreendedor populista, entra se acredita que pode ganhar
#   N: nao-expostos, votam sobre taxacao se M-party vence
#
# Sob threshold (l_1 = 0, l_2 = L):
#   t=1: complementaridade -> E_i ganham diferentemente -> heterogeneidade sigma_E
#   t=2: choque L chega
#
# Timing em t=2:
#   1. l_2 = L revelado
#   2. P-party decide: entrar ou nao
#   3. Se P-party entra: eleicao entre M-party e P-party
#      Se P-party nao entra: M-party unica opcao
#   4. Plataforma vencedora implementada
#   5. N vota sobre taxacao (se compensacao) ou E sofre R (se populismo)
#
# Heterogeneidade de E sob threshold:
#   E_i tem "tipo" x_i ~ Uniform[w_E - sigma_E, w_E + sigma_E]
#   x_i = salario efetivo apos complementaridade em t=1
#   Sob rapid: sigma_E = 0 (todos iguais, x_i = w_E)
#   Sob threshold: sigma_E > 0 (complementaridade diferenciou)
#
# Preferencia de E_i:
#   u_i(M | compensacao) = x_i - L(1 - phi_bar) = x_i - L + L*phi_bar
#   u_i(M | sem compensacao) = x_i - L
#   u_i(R) = theta * W - k = 0.6  (igual para todos)
#
# E_i prefere R (populismo) sobre M sem compensacao quando:
#   theta*W - k > x_i - L  =>  x_i < theta*W - k + L = Delta + L + w_E
#   x_i < 0.6 + 1 = 1.6
#   Como x_i in [1-sigma_E, 1+sigma_E], TODOS preferem R se sigma_E < 0.6
#   (porque mesmo x_i maximo = 1+sigma_E < 1.6 para sigma_E < 0.6)
#
# E_i prefere R sobre M COM compensacao quando:
#   theta*W - k > x_i - L(1-phi_bar) = x_i + Delta
#   0.6 > x_i - 0.4
#   x_i < 1.0
#   Fracao que prefere R mesmo com compensacao:
#   P(x_i < 1.0) para x_i ~ U[1-sigma, 1+sigma]
#   Se sigma_E > 0: fracao = (1.0 - (1-sigma_E)) / (2*sigma_E) = 0.5
#   (por simetria! metade prefere R mesmo com compensacao)
#
# INSIGHT: com compensacao, E se divide 50-50 sob threshold (por simetria)
# Sem compensacao, E unanime em R (para sigma_E < 0.6)
#
# Mas espere: E_i prefere R sobre M+compensacao quando x_i < 1.0 = w_E
# Isso sao os E_i que ganharam MENOS que a media com complementaridade
# Os que ganharam mais (x_i > 1) preferem M+compensacao sobre R
#
# Sob rapid: sigma_E = 0, todos tem x_i = 1.0
# u_i(M+comp) = 1 - 1*(1-0.6) = 0.6 = u_i(R) = 0.6 -> indiferente
# Com phi ligeiramente > phi_bar: todos preferem M -> unanime -> compromisso

# =============================================================================
# EQUILIBRIOS
# =============================================================================

cat("\n=== JOGO DE ELITES: ANALISE ===\n")

# Parametro de heterogeneidade
sigma_E_values <- c(0, 0.1, 0.2, 0.3, 0.4, 0.5)

cat("\n--- Sob RAPID (sigma_E = 0) ---\n")
sigma_E <- 0
cat("E homogeneo: todos x_i = w_E = 1\n")
cat(sprintf("u_E(M|comp) = %.2f, u_E(R) = %.2f\n",
            w_E - L * (1 - phi_bar), theta * W - k))
cat("E unanime: prefere M com compensacao (ou indiferente)\n")
cat("P-party sabe que nao pode ganhar -> NAO ENTRA\n")
cat("Resultado: EQUILIBRIO UNICO (compromisso)\n")

cat("\n--- Sob THRESHOLD (sigma_E > 0) ---\n")

for (sigma_E in sigma_E_values[-1]) {
  cat(sprintf("\nsigma_E = %.1f:\n", sigma_E))

  # Limites de E
  x_min <- w_E - sigma_E
  x_max <- w_E + sigma_E

  # Fracao de E que prefere R sobre M+compensacao
  # R preferido quando x_i < w_E (= 1.0)
  # P(x_i < 1) = (1 - x_min) / (x_max - x_min)
  cutoff_comp <- w_E  # x_i < w_E prefere R mesmo com compensacao
  frac_R_with_comp <- max(0, min(1, (cutoff_comp - x_min) / (x_max - x_min)))

  # Fracao de E que prefere R sobre M sem compensacao
  # R preferido quando x_i < theta*W - k + L = 1.6
  cutoff_no_comp <- theta * W - k + L  # = 1.6
  frac_R_no_comp <- max(0, min(1, (cutoff_no_comp - x_min) / (x_max - x_min)))

  cat(sprintf("  E_i in [%.2f, %.2f]\n", x_min, x_max))
  cat(sprintf("  Fracao que prefere R sobre M+comp: %.0f%%\n",
              frac_R_with_comp * 100))
  cat(sprintf("  Fracao que prefere R sobre M sem comp: %.0f%%\n",
              frac_R_no_comp * 100))

  # Payoffs detalhados para tipos extremos
  cat(sprintf("  Tipo baixo (x=%.2f): u(M|comp)=%.2f, u(M|no comp)=%.2f, u(R)=%.2f\n",
              x_min,
              x_min - L * (1 - phi_bar),
              x_min - L,
              theta * W - k))
  cat(sprintf("  Tipo alto  (x=%.2f): u(M|comp)=%.2f, u(M|no comp)=%.2f, u(R)=%.2f\n",
              x_max,
              x_max - L * (1 - phi_bar),
              x_max - L,
              theta * W - k))

  # Equilibrios
  cat("  EQUILIBRIO COMPROMISSO:\n")
  cat("    P-party nao entra -> M-party oferece comp -> N taxa\n")
  cat(sprintf("    E vota: %.0f%% M, %.0f%% R (R perde, minoria)\n",
              (1 - frac_R_with_comp) * 100, frac_R_with_comp * 100))
  cat("    Resultado: compensacao implementada -> ESTAVEL\n")

  cat("  EQUILIBRIO POPULISTA:\n")
  cat("    P-party entra -> campanha fragmenta E\n")
  cat(sprintf("    Sem comp oferecida: %.0f%% de E vota R\n",
              frac_R_no_comp * 100))
  cat("    Resultado: populista vence -> R -> INSTAVEL\n")

  # Condicao para dois equilibrios
  can_populist <- frac_R_with_comp > 0  # ha base para P-party
  can_compromise <- frac_R_with_comp < 1  # ha base para M-party
  cat(sprintf("  Dois equilibrios existem? %s\n",
              ifelse(can_populist & can_compromise, "SIM", "NAO")))
}

# =============================================================================
# PAPEL DE phi_0 (welfare state pre-existente)
# =============================================================================

cat("\n\n=== PHI_0 COMO SELETOR ===\n")

phi_0_values <- c(0, 0.3, 0.6, 0.8)
sigma_E <- 0.3  # threshold com heterogeneidade moderada

for (phi_0 in phi_0_values) {
  cat(sprintf("\nphi_0 = %.1f (phi_bar = %.1f):\n", phi_0, phi_bar))

  if (phi_0 >= phi_bar) {
    cat("  phi_0 >= phi_bar: compensacao AUTOMATICA\n")
    cat("  Nao precisa de coordenacao politica\n")
    cat("  P-party sem abertura -> COMPROMISSO SEMPRE\n")
  } else {
    # Com phi_0 parcial, compensacao cobre parte
    # E_i com phi_0: u(M) = x_i - L*(1 - phi_0)
    # Precisa construir phi_bar - phi_0 adicional via politica
    cat(sprintf("  phi_0 < phi_bar: precisa construir %.1f adicional\n",
                phi_bar - phi_0))
    cat("  Requer coordenacao politica -> P-party tem abertura\n")
    cat("  DOIS EQUILIBRIOS possiveis\n")

    # Welfare dos tipos extremos sob cada equilibrio
    x_min <- w_E - sigma_E
    x_max <- w_E + sigma_E
    cat(sprintf("  Compromisso: u_E medio = %.2f\n",
                w_E - L * (1 - phi_bar)))
    cat(sprintf("  Populista:   u_E(R) = %.2f (para todos)\n",
                theta * W - k))
    cat(sprintf("  Sem compensacao: u_E medio = %.2f\n",
                w_E - L))
  }
}

# =============================================================================
# RESUMO: MATRIZ 2x2 (trajetoria x regime) COM POPULISMO
# =============================================================================

cat("\n\n=== MATRIZ COMPLETA: RESULTADO CRUZADO COM POPULISMO ===\n")
cat("\nDemocracia fraca (phi_0 = 0):\n")
cat("  Rapid:     ESTAVEL (E homogeneo -> compromisso unico)\n")
cat("  Threshold: DOIS EQUILIBRIOS\n")
cat("    - Compromisso: M-party coordena E -> comp -> estavel\n")
cat("    - Populista:   P-party captura E fragmentado -> R -> instavel\n")

cat("\nDemocracia forte (phi_0 >= phi_bar):\n")
cat("  Rapid:     ESTAVEL (compensacao automatica)\n")
cat("  Threshold: ESTAVEL (compensacao automatica, P-party sem abertura)\n")

cat("\nAutocracia moderada (kappa_0 in [kappa_bar, kappa_bar/eta_R)):\n")
cat("  Rapid:     INSTAVEL (E homogeneo -> coordena -> eta_R < 1)\n")
cat("  Threshold: ESTAVEL  (E heterogeneo -> nao coordena -> eta = 1)\n")

cat("\n=== CROSSED FRAGILITY PRESERVADO ===\n")
cat("Comparando democracia FRACA vs autocracia MODERADA:\n")
cat("  Rapid:     Dem estavel, Aut instavel (como antes)\n")
cat("  Threshold: Dem instavel (eq. populista), Aut estavel (como antes)\n")
cat("  NOTA: sob threshold, democracia fraca PODE sobreviver\n")
cat("  (equilibrio compromisso), mas TAMBEM pode cair (eq. populista)\n")
cat("  Resultado e mais rico que P1(b) original: nao e deterministico\n")
