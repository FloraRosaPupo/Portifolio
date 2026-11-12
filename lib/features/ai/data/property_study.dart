const studyTitle =
    'Como estimar o preço de um imóvel com aprendizado de máquina?';
const studySections = <(String, String)>[
  (
    'O ponto de partida',
    'Uma imobiliária dispõe de dados sobre características dos imóveis e seus preços. Neste projeto integrado da pós-graduação, investigo qual abordagem de aprendizado de máquina faz sentido para apoiar a precificação. É uma proposta metodológica: não houve acesso a uma base real, treinamento ou medição de desempenho.'
  ),
  (
    'Minha leitura do problema',
    'Escolheria aprendizado supervisionado, pois os exemplos têm um valor conhecido: o preço. Embora o enunciado use o termo “classes”, estimar um preço é um problema de regressão, porque a saída é um número contínuo. Essa distinção orienta a escolha dos modelos e das métricas.'
  ),
  (
    'Por onde eu começaria',
    'Usaria Regressão Linear Múltipla como referência inicial pela simplicidade e interpretabilidade. Área construída, localização, quartos, banheiros e vagas seriam atributos candidatos, dependendo da qualidade e da disponibilidade dos dados. Também compararia o Random Forest Regressor para explorar relações não lineares e interações. A combinação de árvores tende a reduzir a variância em relação a uma única árvore; isso não garante que ele supere a regressão linear nesta base.'
  ),
  (
    'Como eu prepararia os dados',
    'Primeiro verificaria origem, período, duplicatas, valores ausentes, inconsistências e valores atípicos. Separaria os conjuntos de treinamento e teste antes de ajustar imputação e codificação de categorias. Esses ajustes seriam aprendidos apenas nos dados de treino de cada divisão da validação cruzada, evitando vazamento de dados. Usaria pipelines para manter esse processo consistente.'
  ),
  (
    'Como eu compararia os modelos',
    'Compararia os modelos com uma referência simples, como o preço mediano do conjunto de treinamento. Usaria validação cruzada no treino para selecionar parâmetros e reservaria o teste para a avaliação final. Se o objetivo fosse prever preços futuros, adotaria uma separação temporal; imóveis repetidos ou muito relacionados precisariam ficar no mesmo grupo para evitar uma avaliação artificialmente otimista.'
  ),
  (
    'O que eu mediria',
    'MAE — Erro Absoluto Médio: média da magnitude das diferenças entre preços previstos e reais, na mesma unidade monetária do preço.\n\nRMSE — Raiz do Erro Quadrático Médio: também na unidade do preço, com maior influência de erros grandes.\n\nR² — Coeficiente de Determinação: compara o erro quadrático ao de uma referência baseada na média; pode ser negativo em dados não vistos.\n\nTambém examinaria os erros por região e faixa de preço, pois uma média geral pode esconder problemas em grupos específicos.'
  ),
  (
    'Da previsão à decisão',
    'A escolha dependeria dos resultados e das necessidades da imobiliária: erro aceitável, interpretabilidade, custo e manutenção. A ferramenta apoiaria a análise comercial, com revisão humana. Preço anunciado e preço efetivo de venda são alvos diferentes; essa definição precisaria ser acordada antes do treinamento.'
  ),
  (
    'O que ainda precisa ser validado',
    'Sem dados e experimentos, não posso afirmar qual modelo seria melhor nem prometer precisão ou retorno financeiro. Os próximos passos seriam obter dados adequados, definir o alvo, testar a proposta e acompanhar mudanças do mercado. Minha contribuição aqui é estruturar o problema e justificar um caminho de avaliação.'
  ),
];
