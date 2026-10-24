# Conteúdo e capturas do portfólio

Experiência e formação revisadas com base no currículo fornecido por Flora em outubro de 2026. Graduação em Sistemas de Informação na UFV concluída em julho de 2025; pós-graduação na UniBH em andamento, com conclusão prevista em dezembro de 2026. O documento original não foi publicado para evitar divulgar o telefone sem necessidade.

O LinkedIn e os três links da Google Play foram fornecidos pela autora. Ela confirmou a atuação no Easy Comlink pela DoubleX, no Roteo durante sua experiência na Roteo e no IndicaZ Profissionais como freelance. A lista não atribui autoria exclusiva nem inventa entregas específicas ou datas para o freelance. O WhatsApp utiliza o número do currículo, conforme solicitação explícita para o botão de contato.

As imagens em `assets/projects` são capturas das interfaces Flutter dos repositórios `projeto_Avalia` e `controle_agua`, executadas localmente com Flutter 3.41.1. Não são imagens geradas ou redesenhos. O ambiente de captura não se conecta ao backend. O Avalia mostra seu painel real, com quatro turmas, doze provas e atividades fictícias fornecidas por respostas HTTP locais simuladas. A autenticação também é simulada, sem credenciais reais, e nenhuma tela de produção foi alterada para a captura. O Bebeu? utiliza conteúdo de hidratação demonstrativo. Nenhuma imagem representa registros reais de uma conta. Fontes e ícones foram carregados explicitamente no renderizador de testes.

O portfólio funciona sem inicialização de Firebase no cliente; o Firebase Hosting continua responsável pela hospedagem. O conteúdo público está organizado em `lib/features/portfolio`.

A captura do Avalia foi conferida contra a branch `main`, commit `9a4d090108dfb6352e7c619ab4a55470f8b90654`. As sombras reais estão habilitadas no renderizador (`debugDisableShadows = false` durante a captura), evitando os contornos de depuração que substituem a elevação dos cartões nos testes Flutter.

## Prévias animadas

`web/previews/avalia.mp4` e `bebeu.mp4` são sequências de 10 segundos, sem áudio, em H.264 (430 × 932, 10 quadros/s, faststart). Somadas, ocupam aproximadamente 200 KB. Foram renderizadas a partir dos widgets reais, com sombras habilitadas e fontes carregadas, sem acessar serviços externos.

- Avalia: perfil de uma aluna fictícia → aba Provas → detalhes de Matemática com quatro acertos em cinco questões → retorno ao perfil. A navegação ocorre pelos controles reais, sem inserir modais fora do fluxo. As respostas do backend são simuladas; o vídeo mostra o resultado demonstrativo da correção, não uma execução nem o tempo de processamento da IA.
- Bebeu: adição de 250 ml com feedback visual e progresso de 1.200 para 1.450 ml, histórico semanal e configuração de lembretes a cada hora, das 08:00 às 20:00 nos dias úteis. Histórico, sessão e preferências são fictícios; nenhuma notificação real é agendada.

O vídeo só é solicitado quando entra na área visível. A reprodução é silenciosa e em loop, com controles nativos para pausar. Ao sair da tela ou ocultar a aba, ele pausa. Movimento reduzido e falhas de vídeo usam as imagens estáticas.
