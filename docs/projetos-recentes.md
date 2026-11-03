# Projetos recentes e demonstrações

Capturas realizadas em 3 de novembro de 2026 a partir das interfaces reais dos
repositórios locais, sem redesenhar telas nem substituir respostas HTTP.

- **RepoMentor:** cadastro de `FloraRosaPupo/repomentor`, consulta de issues públicas
  pela API FastAPI, abertura da descrição, troca de issue e busca por `local`.
  A gravação está no tema escuro; a demonstração publicada fica em
  `https://repomentor-alpha.vercel.app`. Ela não executa inferência nem demonstra
  tempo ou qualidade do Gemma.
- **Triagem:** nove chamados fictícios da demonstração local, classificação com
  o modelo scikit-learn carregado pela API Python. A gravação mostra a fila antes
  da classificação, o clique em “Identificar assuntos”, a organização dos nove
  chamados em três categorias e o relatório de classificação validado na tela.
  Não usa dados pessoais reais. A base pequena e
  sintética não valida desempenho em produção.

O site usa MP4 H.264 sem áudio, com controles, reprodução em loop apenas quando
visível e imagem estática para movimento reduzido. Os GIFs correspondentes ficam
em `web/previews/repomentor.gif` e `web/previews/triagem.gif`. As imagens de capa
ficam em `assets/projects`. As prévias têm proporção de desktop; as de Avalia e
Bebeu continuam na proporção de celular.

## Reprodução

Inicie o frontend do Triagem em 1234 e sua API em 8000. Inicie o frontend do
RepoMentor em 5174 e sua API em 8003, com acesso ao GitHub. A captura encaminha as
requisições do RepoMentor para essa API separada e não altera seu conteúdo.

Com Playwright e Microsoft Edge instalados, na raiz do portfólio:

```sh
node scripts/capture-projects.cjs /caminho/para/node_modules/playwright
python scripts/encode-projects.py
```

A conversão depende de `imageio-ffmpeg`. Os pontos de corte removem o carregamento
inicial desta gravação; devem ser revistos após uma nova captura.

## Stack

As listas dos quatro projetos foram ampliadas a partir dos manifestos diretos de
dependências e das integrações documentadas nos respectivos repositórios. Elas
incluem linguagens, bibliotecas de aplicação, serviços, ferramentas de build e
testes. Não são uma lista de todas as dependências transitivas. Vertex AI é uma
opção de integração do RepoMentor e aparece explicitamente como opcional.

Um único `PageView` reúne RepoMentor, Triagem, Avalia e Bebeu na seção de projetos
pessoais, mostrando um projeto por vez. No desktop, a demonstração fica à esquerda
e o texto à direita; no celular, ficam empilhados. A altura é medida a partir do
conteúdo de cada página para acomodar todas as tecnologias e texto ampliado.

O carrossel avança automaticamente a cada 12 segundos enquanto visível, com pausa
ao passar o mouse, seleção direta nas abas e navegação por deslize.
Movimento reduzido desativa a rotação automática. O cartão usa altura natural para acomodar texto
ampliado. A chave de cada projeto recria a prévia ao trocar o cartão, evitando
que o vídeo do projeto anterior permaneça na tela.
