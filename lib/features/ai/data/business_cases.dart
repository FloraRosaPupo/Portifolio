class BusinessIdea {
  final String sector,
      title,
      source,
      date,
      newsTitle,
      url,
      news,
      question,
      solution,
      data,
      validation,
      limits,
      technique,
      summary;
  const BusinessIdea(
      {required this.sector,
      required this.title,
      required this.source,
      required this.date,
      required this.newsTitle,
      required this.url,
      required this.news,
      required this.question,
      required this.solution,
      required this.data,
      required this.validation,
      required this.limits,
      required this.technique,
      required this.summary});
}

const businessIdeas = <BusinessIdea>[
  BusinessIdea(
      sector: "Varejo e logística · Amazon",
      title: "Prever demanda para posicionar o estoque",
      source: "Amazon · About Amazon",
      date: "27/11/2023 · atualizado em 22/11/2024",
      newsTitle:
          "5 ways Amazon is using AI to improve your holiday shopping and deliver your package faster",
      url:
          "https://www.aboutamazon.com/news/operations/amazon-uses-ai-to-improve-shopping",
      news:
          "A Amazon descreve o SCOT usando deep learning e transformers para prever demanda e orientar estoques. Relato corporativo publicado em 2023 e atualizado em 2024.",
      question: "Como antecipar vendas sem acumular produtos?",
      solution:
          "Minha adaptação: começar com poucos produtos, previsão semanal e regras de pedido com aprovação humana. Comparar média sazonal e modelo preditivo, sem presumir a arquitetura da Amazon.",
      data:
          "Vendas por data e produto, estoque, promoções e prazos. Registrar períodos sem produto.",
      validation:
          "Testar em períodos futuros; comparar MAE e erro por produto com uma referência simples. Acompanhar faltas, perdas e capital em estoque.",
      limits:
          "Proposta não implementada. Previsão numérica não implica regressão linear. Os resultados da empresa não se transferem a um pequeno varejista.",
      technique:
          "Fonte: deep learning e transformers. Tarefa: previsão numérica de séries temporais (meu enquadramento). A matéria não confirma regressão linear nem o protocolo de treinamento.",
      summary:
          "Deep learning para prever demanda e apoiar decisões de estoque."),
  BusinessIdea(
      sector: "Educação digital · Duolingo",
      title: "Escolher exercícios na dificuldade adequada",
      source: "Duolingo · Blog de pesquisa",
      date: "07/10/2020",
      newsTitle: "Learning how to help you learn: Introducing Birdbrain",
      url:
          "https://blog.duolingo.com/learning-how-to-help-you-learn-introducing-birdbrain/",
      news:
          "O Duolingo apresentou o Birdbrain, modelo de machine learning que estima a chance de acerto para personalizar exercícios. A publicação relata testes A/B; é um caso histórico de 2020.",
      question:
          "Como personalizar a prática sem conteúdo fácil ou difícil demais?",
      solution:
          "Minha adaptação: testar recomendações de exercícios contra uma referência pedagógica simples. Educadores revisariam a seleção; respostas ajudariam a avaliar dificuldade, sem rotular uma capacidade permanente do estudante.",
      data:
          "Histórico de respostas, conteúdo e sequência dos exercícios. Minimizar dados pessoais e acordar o uso com a instituição.",
      validation:
          "Avaliar calibração das probabilidades e resultados de aprendizagem em um teste controlado. Engajamento isolado não comprova aprendizagem.",
      limits:
          "Caso histórico: não comprova a arquitetura atual. Algoritmo exato não divulgado nesta fonte. A proposta não determina acesso à educação ou resultados acadêmicos individuais.",
      technique:
          "Fonte: machine learning e previsão de acerto. Meu enquadramento: classificação probabilística de acerto/erro, aprendida com respostas observadas. A matéria não identifica o algoritmo; não afirmo que use regressão logística.",
      summary:
          "Machine learning para estimar probabilidade de acerto e ajustar a seleção de exercícios."),
  BusinessIdea(
      sector: "Agricultura · John Deere / See & Spray",
      title: "Detectar plantas para aplicação localizada",
      source: "Universidade do Arkansas · notícia de pesquisa",
      date: "10/03/2025",
      newsTitle:
          "Precision agriculture research measures effectiveness of See & Spray technology",
      url:
          "https://www.uaex.uada.edu/media-resources/news/2025/march/03-10-2025-see-and-spray-research.aspx",
      news:
          "A Universidade do Arkansas relata um ensaio do See & Spray, que combina imagens em tempo real e machine learning para localizar plantas daninhas. A pesquisa também aponta riscos de ajustes inadequados.",
      question: "Como detectar o alvo correto sem ampliar erros de aplicação?",
      solution:
          "Minha adaptação: avaliar offline um detector em imagens agrícolas autorizadas, com especialistas. A primeira entrega seria um relatório de falhas, sem conectar o protótipo a máquinas de aplicação.",
      data:
          "Imagens autorizadas de diferentes solos, iluminações e fases, anotadas por especialistas e identificadas por área.",
      validation:
          "Separar áreas entre treino e teste. Examinar precisão, sensibilidade, falsos acionamentos e alvos perdidos. Resultados agronômicos exigem ensaio próprio.",
      limits:
          "O ensaio publicado não é do meu protótipo. Resultados não se transferem automaticamente a outra cultura ou região; aplicações exigem profissionais habilitados.",
      technique:
          "Fonte: reconhecimento visual e machine learning. Tarefa: detecção e discriminação de plantas para acionar bicos. A matéria não detalha arquitetura ou regime de treinamento; não atribuo CNN, YOLO ou aprendizado supervisionado específico.",
      summary:
          "Visão computacional e machine learning para detectar plantas daninhas e direcionar pulverização."),
  BusinessIdea(
      sector: "Entretenimento · Netflix",
      title: "Aprender preferências para recomendar conteúdo",
      source: "Netflix Technology Blog",
      date: "21/03/2025",
      newsTitle: "Foundation Model for Personalized Recommendation",
      url:
          "https://netflixtechblog.com/foundation-model-for-personalized-recommendation-1a0bd8e02d39",
      news:
          "A Netflix descreve um modelo de recomendação com transformers, previsão da próxima interação e embeddings. Os autores relacionam a abordagem ao aprendizado semissupervisionado.",
      question: "Como descobrir conteúdo relevante em um catálogo extenso?",
      solution:
          "Minha adaptação: para um catálogo menor, comparar popularidade e busca por metadados com histórico consentido. Modelos sequenciais só fariam sentido com dados e benefício mensurável.",
      data:
          "Catálogo, metadados e interações consentidas, com separação temporal e tratamento de itens novos.",
      validation:
          "Comparar ranking, diversidade e descoberta de itens; testar com grupo de referência. Cliques não substituem satisfação.",
      limits:
          "O artigo descreve uma arquitetura da Netflix. Minha proposta não reproduz seu modelo ou resultados; começa com referências simples.",
      technique:
          "Tarefa: recomendação e ranqueamento. Fonte: transformers autoregressivos, embeddings e previsão do próximo token de interação; os autores descrevem aprendizado semissupervisionado. Não é apenas classificação ou regressão isolada.",
      summary:
          "Transformers e embeddings para aprender sequências de preferência e apoiar recomendações."),
  BusinessIdea(
      sector: "Moda e produto · Walmart",
      title: "Transformar tendências em conceitos de coleção",
      source: "Walmart · Corporate News",
      date: "09/04/2025",
      newsTitle:
          "In an Ever-Changing Environment, Walmart Uses GenAI To Create Cool for Customers",
      url:
          "https://corporate.walmart.com/news/2025/04/09/in-an-ever-changing-environment-walmart-uses-genai-to-create-cool-for-customers",
      news:
          "O Walmart apresenta o Trend-to-Product, ferramenta de IA generativa para sintetizar tendências e criar moodboards, refinados por designers. É um relato corporativo, não uma avaliação independente.",
      question:
          "Como ampliar alternativas sem perder identidade e viabilidade?",
      solution:
          "Minha adaptação: gerar variações com briefing e referências autorizadas. Designers selecionariam e verificariam materiais e modelagem antes da ficha técnica e amostra física. Imagens seriam identificadas como conceitos.",
      data:
          "Briefing, identidade da marca, referências próprias ou licenciadas e restrições de produção.",
      validation:
          "Comparar tempo e custo por conceito aprovado, coerência e viabilidade. Preferência visual não comprova demanda ou vendas.",
      limits:
          "Não transfiro ganhos anunciados pelo Walmart à minha proposta. Conceitos podem ser inviáveis e exigem revisão técnica e de direitos de uso.",
      technique:
          "Fonte: IA generativa para síntese e criação. Tarefa: geração assistida de conteúdo visual e descritivo. A matéria não revela modelo, arquitetura ou treinamento; não atribuo LLM ou modelo de difusão específico.",
      summary:
          "IA generativa para sintetizar tendências e produzir conceitos com curadoria dos designers."),
];
