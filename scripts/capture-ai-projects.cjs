// Records real app interfaces. Only capture data and research SSE are simulated.
const { chromium } = require(process.env.PLAYWRIGHT_PATH || 'playwright');
const fs=require('fs'),path=require('path');
const root=process.cwd();
const pause=ms=>new Promise(r=>setTimeout(r,ms));
const chunks=[
{id:'c45-7',contract:'Contrato 45',clause:'Cláusula 7',page:2,text:'O atraso no pagamento implica multa de 2% sobre o valor devido, acrescida de juros de 1% ao mês.',score:.89},
{id:'c45-3',contract:'Contrato 45',clause:'Cláusula 3',page:1,text:'O pagamento será realizado em até 30 dias após a emissão da nota fiscal.',score:.73},
{id:'c46-2',contract:'Contrato 46',clause:'Cláusula 2',page:1,text:'O serviço será executado conforme o cronograma acordado.',score:.42}];
const answer={with_rag:{answer:'A multa por atraso é de 2% sobre o valor devido, acrescida de juros de 1% ao mês, conforme a Cláusula 7 do Contrato 45 (página 2).',citations:[{contract:'Contrato 45',clause:'Cláusula 7',page:2}],guardrail_triggered:false},without_rag:{answer:'Sem acesso ao contrato, não é possível confirmar a multa específica. É necessário consultar as condições acordadas entre as partes.'},chunks,threshold:.55,prompt_tokens:{without_rag:15,with_rag:224},retrieval_metrics:{precision:.67,recall:1,relevant_retrieved:2,relevant_in_corpus:2},query_point:{x:.2,y:.4}};
async function label(p){await p.evaluate(()=>{const e=document.createElement('div');e.textContent='DEMONSTRAÇÃO · DADOS E RESPOSTAS SIMULADOS';Object.assign(e.style,{position:'fixed',bottom:'14px',right:'18px',zIndex:'2147483647',padding:'10px 14px',borderRadius:'8px',background:'#24162feb',color:'#fff',font:'600 13px Arial',letterSpacing:'.4px',pointerEvents:'none'});document.body.append(e);});}
async function main(){fs.mkdirSync('captures',{recursive:true});const b=await chromium.launch({channel:'msedge',headless:true});const meta={};
try{for(const name of process.argv.slice(2).length?process.argv.slice(2):['assistente-pesquisa','chat-com-contratos']){
const born=Date.now();const c=await b.newContext({viewport:{width:1440,height:1000},recordVideo:{dir:'captures',size:{width:1440,height:1000}},reducedMotion:'reduce'});const p=await c.newPage();
try{
if(name==='chat-com-contratos') await p.route('http://localhost:8000/**',async r=>{const u=new URL(r.request().url());const data=u.pathname==='/documents'?{documents:[{contract:'Contrato 45',supplier:'ABC Suprimentos Ltda',pages:2,chunks:8},{contract:'Contrato 46',supplier:'Beta Serviços Ltda',pages:2,chunks:8},{contract:'Contrato 47',supplier:'Cronos Logística Ltda',pages:2,chunks:8},{contract:'Contrato 48',supplier:'Delta Engenharia Ltda',pages:2,chunks:8}]}:u.pathname==='/map'?{points:Array.from({length:32},(_,i)=>({id:i===0?'c45-7':i===1?'c45-3':`c${i}`,contract:`Contrato ${45+i%4}`,x:Math.cos(i*1.7)*(.2+i%4),y:Math.sin(i*1.7)*(.3+i%4)}))}:answer;if(r.request().method()==='OPTIONS')return r.fulfill({status:204,headers:{'access-control-allow-origin':'*','access-control-allow-headers':'*','access-control-allow-methods':'*'}});await r.fulfill({json:data,headers:{'access-control-allow-origin':'*'}});});
await p.goto(name==='assistente-pesquisa'?(process.env.RESEARCH_URL || 'http://127.0.0.1:19081'):(process.env.CONTRACTS_URL || 'http://127.0.0.1:58345'));
if(name==='assistente-pesquisa')await p.getByPlaceholder('Pergunte sobre um artigo, um tema, ou só diga oi...').waitFor();
if(name==='chat-com-contratos'){await p.waitForTimeout(4000);await p.evaluate(()=>document.querySelector('flt-semantics-placeholder')?.click());await p.getByRole('button',{name:'Perguntar',exact:true}).waitFor();}
await label(p);await pause(500);const start=(Date.now()-born)/1000;await pause(1800);
if(name==='assistente-pesquisa'){
const input=p.getByPlaceholder('Pergunte sobre um artigo, um tema, ou só diga oi...');await input.fill('Como o RAG combina busca de documentos e geração de respostas?');await pause(1700);await input.press('Enter');await p.getByText('Fontes (1)',{exact:true}).waitFor({timeout:30000});await pause(1800);await p.getByText('Fontes (1)',{exact:true}).click();await pause(2000);await p.screenshot({path:'assets/projects/assistente-pesquisa.png'});await p.evaluate(()=>window.scrollTo({top:0,behavior:'smooth'}));await pause(2000);
}else{
await p.mouse.click(482,220);await p.getByText('Com RAG',{exact:true}).waitFor({timeout:20000});await pause(2500);await p.screenshot({path:'assets/projects/chat-com-contratos.png'});await p.mouse.move(1100,700);await p.mouse.wheel(0,480);await pause(2300);await p.mouse.wheel(0,360);await pause(2300);await p.mouse.wheel(0,-840);await pause(2300);
}
const end=(Date.now()-born)/1000;meta[name]={start,duration:end-start};const v=p.video();await c.close();await v.saveAs(path.join(root,'captures',`${name}.webm`));console.log('RECORDED',name,meta[name]);fs.writeFileSync('captures/ai-preview-timing.json',JSON.stringify(meta,null,2));
}catch(e){await p.screenshot({path:`captures/${name}-error.png`}).catch(()=>{});console.error(name,e);await c.close();throw e;}
}}finally{await b.close();}}
main().catch(e=>{console.error(e);process.exitCode=1;});

