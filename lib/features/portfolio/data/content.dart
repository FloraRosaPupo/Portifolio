final curriculo = Uri.base.resolve('Curriculo_Flora_Rosa_Pupo.pdf').toString();
const github = 'https://github.com/FloraRosaPupo';
const linkedin = 'https://www.linkedin.com/in/florarosa/';
const email = 'mailto:florapupo@gmail.com';
const whatsapp = 'https://wa.me/5534993130077';
const career = [
  (
    'DoubleX',
    'Desenvolvedora Full Stack',
    'MAI 2025',
    'Desenvolvimento full stack no Easy Comlink, plataforma B2B de cotações e negociações. Flutter/Dart, Node.js, APIs REST, bancos de dados e CI/CD.',
  ),
  (
    'FlowCode',
    'Desenvolvedora de Software',
    'NOV 2024 — MAI 2025',
    'Desenvolvimento em Flutter/FlutterFlow e Supabase, gestão de projetos, contato com clientes e levantamento de requisitos.',
  ),
  (
    'Roteo',
    'Estagiária de Desenvolvimento Mobile',
    'JUN 2024 — NOV 2024',
    'Atuação no aplicativo Roteo, com desenvolvimento em Flutter, consumo de APIs REST, gerenciamento de estado e integração com Firebase.',
  ),
  (
    'Prefeitura de Rio Paranaíba',
    'Estagiária',
    'MAR 2023 — OUT 2023',
    'Concepção e desenvolvimento de um aplicativo interno em Flutter para coleta e organização de informações do setor imobiliário.',
  ),
  (
    'InfoAlto Empresa Júnior',
    'Gerente de Projetos → Vice-Presidente → Presidente',
    'ABR 2021 — DEZ 2023',
    'Liderança de equipes, gestão de projetos, levantamento de requisitos, planejamento estratégico e desenvolvimento de parcerias.',
  ),
];
const skills = {
  'Engenharia de IA': [
    'Python',
    'LLMs',
    'RAG',
    'MCP',
    'LangGraph',
    'Ollama',
    'Embeddings',
    'Avaliação de respostas'
  ],
  'Mobile & interfaces': [
    'Flutter',
    'Dart',
    'FlutterFlow',
    'UX/UI',
    'Bloc / Cubit',
  ],
  'Backend & dados': [
    'Node.js',
    'APIs REST',
    'SQL',
    'PostgreSQL',
    'Supabase',
    'Firebase',
    'SQLite',
  ],
  'Arquitetura & qualidade': [
    'Clean Architecture',
    'MVVM',
    'Testes unitários',
    'Golden Tests',
    'Git',
    'Code Review',
  ],
};
const aiPractices = [
  (
    'Especificação antes do código',
    'Descrevo o comportamento esperado, as regras de negócio e os limites antes de pedir qualquer implementação a um agente.',
  ),
  (
    'Agentes orquestradores',
    'Divido o trabalho em tarefas pequenas e verificáveis e coordeno agentes que executam cada etapa, em vez de pedir uma funcionalidade inteira de uma vez.',
  ),
  (
    'Agentes de code review',
    'Um agente revisa o que foi gerado em busca de falhas e inconsistências antes de eu revisar. A decisão final de arquitetura, segurança e simplicidade continua sendo minha.',
  ),
  (
    'Hooks e automação',
    'Uso hooks para automatizar verificações no fluxo de trabalho com o Claude, para que regras e checagens rodem sempre, sem depender de lembrar.',
  ),
  (
    'Testes como proteção',
    'Testes unitários, de widget e Golden Tests mostram se o código gerado respeita as regras. A CI roda as verificações a cada mudança.',
  ),
  (
    'IA também no produto',
    'Sou pós-graduada em Inteligência Artificial Aplicada aos Negócios pela UniBH e levo esse olhar para onde a IA gera valor no produto.',
  ),
];
const aiTools = [
  'RAG',
  'MCP',
  'LangGraph',
  'Ollama',
  'Evals',
  'Claude / Claude Code',
  'Agentes orquestradores',
  'Agentes de code review',
  'Hooks',
  'Análise e refatoração',
  'Documentação',
  'Testes automatizados',
  'GitHub Actions',
];

const aiProjects = [
  (
    'Chat com contratos',
    'RAG local para consultar contratos com citações de cláusula e página. Compara respostas com e sem RAG e inclui avaliações automatizadas na CI.',
    ['Flutter', 'Python', 'FastAPI', 'ChromaDB', 'Ollama'],
    'https://github.com/FloraRosaPupo/chat-com-contratos',
  ),
  (
    'Assistente de pesquisa',
    'Consulta artigos científicos com RAG e fontes citadas. LangGraph orquestra a recuperação e a resposta; servidores MCP expõem busca no arXiv, ingestão e consulta de trechos.',
    ['Python', 'LangGraph', 'MCP', 'pgvector', 'RAG'],
    'https://github.com/FloraRosaPupo/assistente-pesquisa',
  ),
  (
    'Base Aurora',
    'Simulador educativo de uma base em Marte, criado com Kevyn na equipe Kera para o NASA Space Apps Challenge 2026. Flutter Web e Dart sustentam as decisões da missão, com uma cena 3D em Three.js. A assistente AURA usa busca lexical local em referências da NASA. O backend opcional em Node.js permite usar RAG com modelos de linguagem e validação de fontes.',
    ['Flutter Web', 'Dart', 'Three.js', 'WebGL', 'Node.js', 'RAG'],
    'https://github.com/FloraRosaPupo/base-aurora',
  ),
];

const aiProjectSlugs = ['chat-com-contratos', 'assistente-pesquisa', 'base-aurora'];

double aiProjectPreviewAspectRatio(int index) =>
    aiProjectSlugs[index] == 'base-aurora' ? 16 / 9 : 1440 / 1000;
