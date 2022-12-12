# Estatística e Probabilidade

Disciplina do curso de Ciência da Computação CEFETRJ, ministrada pelo professor Pedro Gonzalez

## Medidas descritivas

### Medidas de Tendência Central:

Indicam o ponto central

<strong>1 - Média</strong>:

Dados populacionais:

$ \mu = \frac{\sum(x_i)}{N} $

Dados amostrais:

$ \overline{x} = \frac{\sum(x_i)}{n} $

$ \overline{x} = \frac{\sum(x_i \cdot F_i)}{n} $

Propriedade importante, a soma dos desvios é zero:

$ \sum(x_i - \overline{x}) = 0 $

A média é afetada por valores discrepantes/extremos.

<strong>2 - Mediana</strong>:

Os dados precisam estar em rol (ordenados).

Dados populacionais:

$ p = 0.5(n + 1) $

n é o tamanho da coluna

$ Md = X{l_p} + F_p(X_{lp + 1} - X*{l_p}) $

lp é a parte inteira de p e Fp é a parte decimal.

$ X{l_p} $ 

é o índice lp

Dados amostrais:

$ p = \frac{n}{2} $

$ Md = l*i + \frac{h(p - F*{ai - 1})}{F_i} $

É utilizado o indice i tal que Fai >= p

<strong>3 - Moda</strong>:

Para dados populacionais é o elemento que mais aparece da variável.

Dados amostrais:

$ M*o = l_i + \frac{h(F_i - F*{i - 1})}{(F*i - F*{i - 1}) + ((F*i - F*{i + 1}))} $

É utilizado o indice i tal que max(Fi), ou seja, maior frequência absoluta (classe modal).

Os dados podem também ser amodal (observações/tuplas/linhas/samples com mesma frequencia absoluta Fi) e plurimodal (várias observações com frequências iguais).

### Medidas Separatrizes

Os dados devem estar em rol, "25% dos dados são menores ou iguais ao primeiro quartil Q1".

Dados populacionais

$ p = 0.25(n + 1) $

$ Q*1 = X*{l*p} + F_p(X*{l*{p + 1}} - X*{l_p}) $

Exemplo quadragesimo decil ($ p = 0.40(n + 1) $) e nonagesimo nono percentil ($ p = 0.99(n + 1) $).
Mesma fórmula porém em vez de ser escrito como Q1 é escrito como D40 e P99.

Para Q2 e Q3 são usados 0.5 e 0.75 em vez de 0.25 no cálculo do p, respectivamente.

Dados amostrais:

Para o calculo do p divide n por 4 para os quartis, por 10 para os decis e 100 para os percentis. Para o valor de k, se por exemplo se deseja o terceiro quartil, k = 3.

$ p = \frac{n}{4} \cdot k $

$ Md = l*i + \frac{h(p - F*{ai - 1})}{F_i} $

É utilizado o indice i tal que Fai >= p

Q2 = D5 = P50 = Md

### Medidas de Dispersão

Indicam se os dados estão ou não próximos uns dos outros. É necessário pelo menos uma medida de tendencia central e uma de dispersão para descrever os dados, visto que a média em dados sem variação e com variação muito grande (pois a média não será uma medida de tendencia central representativa).

<strong>Amplitude total</strong>:

$ AT = max(data$var) - min(data$var) $

<strong>Amplitude interquartílica e semi-interquartílica</strong>:

$ dq = Q_3 - Q_1 $

$ dqm = \frac{Q_3 - Q_1}{2} $

<strong>Desvio médio e variância</strong>:

$ D_m = \frac{\sum(|x_i - \mu|)}{N} $

$ \sigma^2 = \frac{\sum(x_i - \mu)^2}{N} $

Notação para dados amostrais:

$ D_m = \frac{\sum(|x_i - \overline{x}| \cdot F_i)}{n} $

$ s^2 = \frac{\sum(x_i - \overline{x})^2 \cdot F_i}{n - 1} $

Note que a variância lembra bastante a função de custo MSE (Mean squared error). É uma função contínua e diferenciável.

<strong>Desvio padrão</strong>:

É a raiz quadrada da Variância. Para dados populacionais a notação é sigma e para amostrais é s.

<strong>Coeficiente de Variação</strong>:

Útil para verificar homogeneidade dos dados. Caso o coeficiente seja maior que 50% a distribuição é altamente dispersa (heterogênea). Se for menor que 50% a média é uma medida representativa. Média tendendo a 0 torna esse coeficiente inútil.

$ CoefV = \frac{\sigma}{\mu} $ ou $ CoefV = \frac{s}{\overline{x}} $

### Medidas de Assimetria e Curtose

Indica a forma de distribuição dos dados

Coeficiente de assimetria de Pearson (As)

$ As = \frac{\mu - M_o}{\sigma} $ ou $ As = \frac{\overline{x} - M_o}{s} $

Distribuição é simétrica se média == mediana == moda ou As == 0.

Se média <= mediana <= moda ou As < 0 é assimétrica negativa. Isso significa que a cauda está à esquerda da distribuição (left skewed).

Se média >= mediana >= moda ou As > 0 é assimétrica positiva. Isso significa que a cauda está à direita da distribuição (right skewed).

A medida de Curtose indica o grau de achatamento e quantifica a concentração ou dispersão dos dados:

$ K = \frac{Q*3 - Q_1}{2(P*{90} - P\_{10})} $

se K < 0.263 a distribuilção é leptocúrtica (concentração no centro).
se K = 0.263 a distribuilção é mesocúrtica (razoavelmente no centro).
se K > 0.263 a distribuilção é platicúrtica (dist. aberta, não concentrado no centro).

### Boxplot

- Limite inferior Li (Li = Q1 - 1.5dq)
- Q1
- Mediana
- Q3
- Limite superior Ls (Ls = Q3 + 1.5dq)

Dados inferiores ou superiores ao Li e Ls sção outliers. No intervalo interquartílica existe 50% dos dados, 25% entre Q1 e Md e 25% entre Md e Q3.

Cada linha a esquerda ou direita da caixa mais os outliers contem 25% dos dados. Caso a caixa do boxplot esteja mais próximo dos valores menores, a distribuição é right skewed, pois a cauda estará na direita (assimetria positiva), indicando que os dados dispersam para valores maiores.
