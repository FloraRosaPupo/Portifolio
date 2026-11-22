"""Deterministic fictional SSE fixture, used only for portfolio recordings."""
import json,time
from http.server import BaseHTTPRequestHandler,ThreadingHTTPServer
class Handler(BaseHTTPRequestHandler):
 def do_POST(self):
  self.rfile.read(int(self.headers.get('Content-Length',0)))
  self.send_response(200);self.send_header('Content-Type','text/event-stream');self.end_headers()
  text="O RAG combina recuperação de documentos e geração de texto. Primeiro, busca trechos relevantes em uma base de conhecimento; depois, usa esses trechos como contexto para responder com referências. No artigo de Lewis et al. (2020), o modelo combina memória paramétrica e uma base externa recuperável [2005.11401].\n\nIsso ajuda a fundamentar a resposta, mas a qualidade continua dependendo dos documentos e da recuperação. As fontes devem ser conferidas."
  for word in text.split(' '):
   self.wfile.write(('data: '+json.dumps({'tipo':'token','texto':word+' '})+'\n\n').encode());self.wfile.flush();time.sleep(.06)
  self.wfile.write(('data: '+json.dumps({'tipo':'fim','fontes':[{'paper_id':'2005.11401','texto':'Lewis et al. (2020). Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks. Exemplo demonstrativo de fonte: combina recuperação de passagens e geração condicionada ao contexto.'}]})+'\n\n').encode());self.wfile.flush()
s=ThreadingHTTPServer(('127.0.0.1',0),Handler)
print('RESEARCH_FIXTURE_PORT='+str(s.server_port),flush=True)
s.serve_forever()
