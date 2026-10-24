final curriculo = Uri.base.resolve('Curriculo_Flora_Rosa_Pupo.pdf').toString();
const github = 'https://github.com/FloraRosaPupo';
const linkedin = 'https://www.linkedin.com/in/florarosa/';
const email = 'mailto:florapupo@gmail.com';
const whatsapp = 'https://wa.me/5534993130077';
const career = [
  (
    'DoubleX',
    'Desenvolvedora Front-End',
    'MAI 2025 — ATUAL',
    'Atuação no Easy Comlink. Aplicações multiplataforma com Flutter/Dart, backend com Node.js e integrações com APIs REST. Interfaces responsivas, componentes reutilizáveis e integração com bancos de dados.'
  ),
  (
    'FlowCode',
    'Desenvolvedora de Software',
    'NOV 2024 — MAI 2025',
    'Aplicações em Flutter e FlutterFlow, funcionalidades em Custom Code e integrações com Supabase. Funções, consultas e regras de dados em PostgreSQL.'
  ),
  (
    'Roteo',
    'Estagiária de Desenvolvimento Mobile',
    'JUN 2024 — NOV 2024',
    'Atuação no aplicativo Roteo, com desenvolvimento em Flutter, consumo de APIs REST, gerenciamento de estado e integração com Firebase.'
  ),
  (
    'Prefeitura de Rio Paranaíba',
    'Estagiária',
    'MAR 2023 — OUT 2023',
    'Concepção e desenvolvimento de um aplicativo interno em Flutter para coleta e organização de informações do setor imobiliário.'
  ),
  (
    'InfoAlto Empresa Júnior',
    'Gerente de Projetos → Vice-Presidente → Presidente',
    'ABR 2021 — DEZ 2023',
    'Liderança de equipes, gestão de projetos, levantamento de requisitos, planejamento estratégico e desenvolvimento de parcerias.'
  ),
];
const skills = {
  'Mobile & interfaces': [
    'Flutter',
    'Dart',
    'FlutterFlow',
    'UX/UI',
    'Bloc / Cubit'
  ],
  'Backend & dados': [
    'Node.js',
    'APIs REST',
    'SQL',
    'PostgreSQL',
    'Supabase',
    'Firebase',
    'SQLite'
  ],
  'Arquitetura & qualidade': [
    'Clean Architecture',
    'MVVM',
    'Testes unitários',
    'Golden Tests',
    'Git',
    'Code Review'
  ],
};
const aiPractices = [
  (
    'Especificação antes do código',
    'Descrevo o comportamento esperado, as regras de negócio e os limites antes de pedir qualquer implementação a um agente.'
  ),
  (
    'Agentes orquestradores',
    'Divido o trabalho em tarefas pequenas e verificáveis e coordeno agentes que executam cada etapa, em vez de pedir uma funcionalidade inteira de uma vez.'
  ),
  (
    'Agentes de code review',
    'Um agente revisa o que foi gerado em busca de falhas e inconsistências antes de eu revisar. A decisão final de arquitetura, segurança e simplicidade continua sendo minha.'
  ),
  (
    'Hooks e automação',
    'Uso hooks para automatizar verificações no fluxo de trabalho com o Claude, para que regras e checagens rodem sempre, sem depender de lembrar.'
  ),
  (
    'Testes como proteção',
    'Testes unitários, de widget e Golden Tests mostram se o código gerado respeita as regras. A CI roda as verificações a cada mudança.'
  ),
  (
    'IA também no produto',
    'Curso a pós-graduação em Inteligência Artificial Aplicada aos Negócios (UniBH) e levo esse olhar para onde a IA gera valor no produto.'
  ),
];
const aiTools = [
  'Claude / Claude Code',
  'Agentes orquestradores',
  'Agentes de code review',
  'Hooks',
  'Análise e refatoração',
  'Documentação',
  'Testes automatizados',
  'GitHub Actions',
];
