from pathlib import Path
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, PageBreak, KeepTogether
from reportlab.lib.styles import ParagraphStyle
from reportlab.lib.colors import HexColor
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.pagesizes import A4

ROOT=Path(__file__).resolve().parents[1]
for name,file in [('Arial','arial.ttf'),('Arial-Bold','arialbd.ttf')]:
 pdfmetrics.registerFont(TTFont(name,str(Path('C:/Windows/Fonts')/file)))
styles={
 'name':ParagraphStyle('name',fontName='Arial-Bold',fontSize=21,leading=25,spaceAfter=5),
 'role':ParagraphStyle('role',fontName='Arial-Bold',fontSize=11,leading=15,spaceAfter=7),
 'contact':ParagraphStyle('contact',fontName='Arial',fontSize=9,leading=13,spaceAfter=3),
 'body':ParagraphStyle('body',fontName='Arial',fontSize=10,leading=14,spaceAfter=6),
 'section':ParagraphStyle('section',fontName='Arial-Bold',fontSize=11,leading=15,spaceBefore=12,spaceAfter=8),
 'job':ParagraphStyle('job',fontName='Arial-Bold',fontSize=10,leading=14,spaceAfter=3),
 'small':ParagraphStyle('small',fontName='Arial',fontSize=9.4,leading=13,spaceAfter=5),
}
flow=[]
def p(text,kind='body'):flow.append(Paragraph(text,styles[kind]))
def section(text):p(text,'section')
def job(title,dates,body):
 flow.append(KeepTogether([Paragraph(title,styles['job']),Paragraph(dates,styles['small']),Paragraph(body,styles['body'])]))
def project(title,slug,text):
 flow.append(KeepTogether([Paragraph(title,styles['job']),Paragraph(text,styles['body']),Paragraph(f'<link href="https://github.com/FloraRosaPupo/{slug}">github.com/FloraRosaPupo/{slug}</link>',styles['small'])]))
p('FLORA ROSA PUPO','name')
p('ENGENHEIRA DE IA | DESENVOLVEDORA FULL STACK','role')
p('Telefone: (34) 99313-0077 | E-mail: <link href="mailto:florapupo@gmail.com">florapupo@gmail.com</link>','contact')
p('LinkedIn: <link href="https://www.linkedin.com/in/florarosa/">linkedin.com/in/florarosa</link> | GitHub: <link href="https://github.com/FloraRosaPupo">github.com/FloraRosaPupo</link>','contact')
p('Portfólio: <link href="https://flora-rosa.web.app/">flora-rosa.web.app</link>','contact')
section('RESUMO PROFISSIONAL')
p('Engenheira de IA e desenvolvedora Full Stack com experiência em aplicações web e mobile, backend Node.js, APIs REST e bancos de dados. Desenvolvo projetos de IA aplicada com Python, FastAPI, modelos de linguagem (LLMs), recuperação aumentada por geração (RAG), LangGraph e Model Context Protocol (MCP). Experiência em regras de negócio, integrações, arquitetura de software, testes e revisão de código. Graduada em Sistemas de Informação pela UFV e pós-graduanda em Inteligência Artificial Aplicada aos Negócios pela UniBH.')
section('COMPETÊNCIAS TÉCNICAS')
p('<b>Inteligência artificial:</b> Python, LLMs, RAG, embeddings, busca vetorial, LangGraph, MCP, Ollama, ChromaDB, pgvector e avaliação de respostas em projetos pessoais. Machine learning com TF-IDF e regressão logística.')
p('<b>Desenvolvimento:</b> Flutter, Dart, FlutterFlow, Node.js, JavaScript, TypeScript, React, FastAPI, APIs REST, PostgreSQL, SQL, SQLite, Supabase e Firebase.')
p('<b>Arquitetura e qualidade:</b> Clean Architecture, MVVM, regras de negócio, testes unitários, testes de integração, Golden Tests, Git, GitHub Actions, CI/CD e Code Review. Levantamento de requisitos, gestão de projetos, Scrum e Kanban.')
section('EXPERIÊNCIA PROFISSIONAL')
job('DoubleX | Desenvolvedora de Software - Flutter / Node.js','Mai. 2025 - Out. 2026','Desenvolvimento de aplicações multiplataforma com Flutter/Dart na plataforma B2B Easy Comlink. Implementação de interfaces, regras de negócio e integrações com APIs REST e backend Node.js. Atuação com bancos de dados, Git, revisão de código e práticas de desenvolvimento com apoio de IA.')
job('FlowCode | Desenvolvedora de Software','Nov. 2024 - Mai. 2025','Desenvolvimento com Flutter, FlutterFlow e Custom Code. Integração com APIs REST, Supabase e PostgreSQL, incluindo consultas, funções e regras de dados. Levantamento de requisitos, contato com clientes e gestão de projetos.')
job('Roteo | Estagiária de Desenvolvimento Mobile','Jun. 2024 - Nov. 2024','Desenvolvimento de funcionalidades em Flutter, consumo de APIs REST, gerenciamento de estado e integração com Firebase.')
flow.append(PageBreak())
section('EXPERIÊNCIA PROFISSIONAL - CONTINUAÇÃO')
job('Prefeitura Municipal de Rio Paranaíba | Estagiária','Mar. 2023 - Out. 2023','Concepção e desenvolvimento de aplicativo interno em Flutter para coleta e organização de informações do setor imobiliário.')
job('InfoAlto Empresa Júnior | Gestão de Projetos, Vice-Presidência e Presidência','Abr. 2021 - Dez. 2023','Liderança de equipes, gestão de projetos, levantamento de requisitos, planejamento estratégico, relacionamento com stakeholders e desenvolvimento de parcerias.')
section('PROJETOS DE INTELIGÊNCIA ARTIFICIAL')
project('Chat com contratos | RAG local e avaliação de respostas','chat-com-contratos','Aplicação Flutter e Python/FastAPI para consultar contratos com citações de cláusula e página. Pipeline com embeddings, ChromaDB e Ollama, comparação de respostas com e sem RAG e avaliações automatizadas na CI.')
project('Assistente de pesquisa | LangGraph e servidores MCP','assistente-pesquisa','Assistente de consulta a artigos científicos com RAG e fontes citadas. Orquestração com LangGraph e servidores MCP para busca no arXiv, ingestão de documentos e recuperação de trechos com pgvector.')
project('RepoMentor | LLMs, Python/FastAPI e React','repomentor','Projeto para explorar repositórios e issues do GitHub e apoiar a preparação de contribuições com Gemma. Interface React e API FastAPI, com análises e orientações sujeitas à revisão humana.')
project('Triagem | Machine learning e classificação de chamados','ticket-triage-ml','Projeto didático de sugestão de assuntos para chamados de suporte com TF-IDF e regressão logística. Interface React e API Python. Base pequena e sintética, com revisão humana; sem resultados de desempenho em produção.')
section('FORMAÇÃO ACADÊMICA')
p('<b>UniBH - Pós-graduação em Inteligência Artificial Aplicada aos Negócios</b><br/>Em andamento em 2026, com conclusão prevista para dezembro de 2026.')
p('<b>Universidade Federal de Viçosa (UFV) - Sistemas de Informação</b><br/>Bacharelado concluído em julho de 2025. Campus Rio Paranaíba.')
section('CERTIFICAÇÕES')
p('<b>Claude in Action</b> - Anthropic')
p('<b>Model Context Protocol: Advanced Topics</b> - Anthropic')
p('Credenciais: <link href="https://www.linkedin.com/in/florarosa/details/certifications/">linkedin.com/in/florarosa/details/certifications</link>', 'small')

def footer(c,doc):
 c.saveState();c.setFont('Arial',8);c.setFillColor(HexColor('#666666'));c.drawRightString(A4[0]-42,25,str(doc.page));c.restoreState()
output=ROOT/'web/Curriculo_Flora_Rosa_Pupo.pdf'
doc=SimpleDocTemplate(str(output),pagesize=A4,rightMargin=42,leftMargin=42,topMargin=36,bottomMargin=40,title='Flora Rosa Pupo - Engenharia de IA e Desenvolvimento Full Stack',author='Flora Rosa Pupo')
doc.build(flow,onFirstPage=footer,onLaterPages=footer)
print(output)

