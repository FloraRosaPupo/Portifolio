import 'business_cases.dart';

const businessTranslations = <String, (String, String)>{
  "0-sector": (
    "Retail and logistics · Amazon",
    "Comercio y logística · Amazon"
  ),
  "0-title": (
    "Forecast demand to position inventory",
    "Prever demanda para ubicar existencias"
  ),
  "0-news": (
    "Amazon describes SCOT using deep learning and transformers for demand forecasts and inventory. Company report published in 2023 and updated in 2024.",
    "Amazon describe SCOT con deep learning y transformers para prever demanda e inventario. Relato corporativo de 2023, actualizado en 2024."
  ),
  "0-technique": (
    "Source: deep learning and transformers. Task: numeric time-series forecasting (my framing). No confirmation of linear regression or the training protocol.",
    "Fuente: deep learning y transformers. Tarea: previsión numérica de series temporales (mi encuadre). No confirma regresión lineal ni protocolo de entrenamiento."
  ),
  "0-summary": (
    "Deep learning to forecast demand and support inventory decisions.",
    "Deep learning para prever demanda y apoyar inventario."
  ),
  "0-question": (
    "How can sales be anticipated without accumulating inventory?",
    "¿Cómo anticipar ventas sin acumular productos?"
  ),
  "0-solution": (
    "My adaptation: a few products, weekly forecasts and ordering rules with human approval. Compare a seasonal average with a predictive model, without assuming Amazon’s architecture.",
    "Mi adaptación: pocos productos, previsión semanal y reglas con aprobación humana. Comparar media estacional y modelo predictivo sin asumir la arquitectura de Amazon."
  ),
  "0-data": (
    "Sales by date and product, stock, promotions and lead times. Record stockouts.",
    "Ventas por fecha y producto, existencias, promociones y plazos. Registrar faltantes."
  ),
  "0-validation": (
    "Test future periods against a simple baseline using MAE and per-product errors. Track stockouts, waste and inventory capital.",
    "Probar períodos futuros frente a una referencia simple con MAE y error por producto. Medir faltantes, pérdidas y capital."
  ),
  "0-limits": (
    "Unimplemented proposal. Numeric forecasting does not imply linear regression. Company results do not transfer to a small retailer.",
    "Propuesta no implementada. Previsión numérica no implica regresión lineal. Los resultados no se transfieren a un pequeño comercio."
  ),
  "1-sector": ("Digital education · Duolingo", "Educación digital · Duolingo"),
  "1-title": (
    "Choose exercises at the right difficulty",
    "Elegir ejercicios con dificultad adecuada"
  ),
  "1-news": (
    "Duolingo introduced Birdbrain, a machine-learning model estimating answer success to personalize exercises. It reports A/B tests; this is a historical 2020 case.",
    "Duolingo presentó Birdbrain, modelo de machine learning que estima aciertos para personalizar ejercicios. Informa pruebas A/B; es un caso histórico de 2020."
  ),
  "1-technique": (
    "Source: machine learning and success prediction. My framing: probabilistic classification of correct/incorrect answers learned from observations. The algorithm is not named; I do not claim logistic regression.",
    "Fuente: machine learning y predicción de acierto. Mi encuadre: clasificación probabilística de acierto/error a partir de observaciones. No nombra el algoritmo; no afirmo regresión logística."
  ),
  "1-summary": (
    "Machine learning to estimate answer success and adjust exercise selection.",
    "Machine learning para estimar aciertos y ajustar ejercicios."
  ),
  "1-question": (
    "How can practice be personalized without being too easy or too hard?",
    "¿Cómo personalizar la práctica sin contenido demasiado fácil o difícil?"
  ),
  "1-solution": (
    "My adaptation: test exercise recommendations against a simple teaching baseline. Educators review selection; answers inform difficulty without labeling permanent student ability.",
    "Mi adaptación: probar recomendaciones frente a una referencia pedagógica simple. Docentes revisan la selección; respuestas informan dificultad sin etiquetar capacidad permanente."
  ),
  "1-data": (
    "Answer histories, exercise content and sequences. Minimize personal data and agree usage with the institution.",
    "Historial de respuestas, contenido y secuencias. Minimizar datos personales y acordar su uso."
  ),
  "1-validation": (
    "Evaluate probability calibration and learning outcomes in a controlled test. Engagement alone does not establish learning.",
    "Evaluar calibración y aprendizaje en una prueba controlada. La interacción no demuestra aprendizaje."
  ),
  "1-limits": (
    "Historical case; it does not establish today’s architecture. Exact algorithm undisclosed here. The proposal does not decide educational access or individual outcomes.",
    "Caso histórico; no demuestra la arquitectura actual. Algoritmo exacto no divulgado. La propuesta no decide acceso educativo ni resultados individuales."
  ),
  "2-sector": (
    "Agriculture · John Deere / See & Spray",
    "Agricultura · John Deere / See & Spray"
  ),
  "2-title": (
    "Detect plants for targeted application",
    "Detectar plantas para aplicación localizada"
  ),
  "2-news": (
    "The University of Arkansas reports a See & Spray trial using real-time images and machine learning to locate weeds, including risks from unsuitable settings.",
    "La Universidad de Arkansas informa un ensayo de See & Spray con imágenes en tiempo real y machine learning para localizar malezas, incluidos riesgos de ajustes inadecuados."
  ),
  "2-technique": (
    "Source: visual recognition and machine learning. Task: detecting and distinguishing plants to control nozzles. Architecture and training regime are unspecified; I do not attribute CNN, YOLO or a specific supervised method.",
    "Fuente: reconocimiento visual y machine learning. Tarea: detectar y distinguir plantas para controlar boquillas. No detalla arquitectura ni entrenamiento; no atribuyo CNN, YOLO ni método supervisado específico."
  ),
  "2-summary": (
    "Computer vision and machine learning to detect weeds and target spraying.",
    "Visión computacional y machine learning para detectar malezas y dirigir pulverización."
  ),
  "2-question": (
    "How can targets be detected without increasing application errors?",
    "¿Cómo detectar objetivos sin aumentar errores de aplicación?"
  ),
  "2-solution": (
    "My adaptation: offline detector evaluation using authorized agricultural images and specialists. First deliver an error analysis, without connecting to spraying machinery.",
    "Mi adaptación: evaluar un detector sin conexión con imágenes autorizadas y especialistas. Entregar análisis de errores sin conectar maquinaria."
  ),
  "2-data": (
    "Authorized images across soils, lighting and growth stages, annotated by specialists and identified by field.",
    "Imágenes autorizadas con distintos suelos, luz y crecimiento, anotadas por especialistas e identificadas por área."
  ),
  "2-validation": (
    "Separate fields between training and testing. Examine precision, recall, false activation and missed targets. Agronomic outcomes require a dedicated trial.",
    "Separar áreas entre entrenamiento y prueba. Examinar precisión, sensibilidad, activaciones falsas y objetivos perdidos. Resultados agronómicos requieren ensayos."
  ),
  "2-limits": (
    "The published trial is not my prototype. Results do not automatically transfer to another crop or region; application requires qualified professionals.",
    "El ensayo no es de mi prototipo. Los resultados no se transfieren a otro cultivo o región; la aplicación requiere profesionales cualificados."
  ),
  "3-sector": ("Entertainment · Netflix", "Entretenimiento · Netflix"),
  "3-title": (
    "Learn preferences to recommend content",
    "Aprender preferencias para recomendar contenido"
  ),
  "3-news": (
    "Netflix describes a recommendation model using transformers, next-interaction prediction and embeddings. Authors relate it to semi-supervised learning.",
    "Netflix describe un modelo de recomendación con transformers, predicción de la próxima interacción y embeddings. Los autores lo relacionan con aprendizaje semisupervisado."
  ),
  "3-technique": (
    "Task: recommendation and ranking. Source: autoregressive transformers, embeddings and next-interaction-token prediction; authors describe semi-supervised learning. Not merely standalone classification or regression.",
    "Tarea: recomendación y ordenación. Fuente: transformers autorregresivos, embeddings y próximo token de interacción; autores describen aprendizaje semisupervisado. No es solo clasificación o regresión."
  ),
  "3-summary": (
    "Transformers and embeddings to learn preference sequences and support recommendations.",
    "Transformers y embeddings para aprender preferencias y apoyar recomendaciones."
  ),
  "3-question": (
    "How can relevant content be discovered in a large catalog?",
    "¿Cómo descubrir contenido relevante en un catálogo amplio?"
  ),
  "3-solution": (
    "My adaptation: for a smaller catalog, compare popularity and metadata retrieval with consented histories. Sequence models require sufficient data and measurable benefit.",
    "Mi adaptación: para un catálogo pequeño comparar popularidad y metadatos con historial consentido. Modelos secuenciales requieren datos y beneficios medibles."
  ),
  "3-data": (
    "Catalog, metadata and consented interactions, temporal splits and new-item handling.",
    "Catálogo, metadatos e interacciones consentidas, separación temporal y artículos nuevos."
  ),
  "3-validation": (
    "Compare ranking quality, diversity and discovery with a reference group. Clicks do not replace satisfaction.",
    "Comparar ranking, diversidad y descubrimiento con un grupo de referencia. Clics no equivalen a satisfacción."
  ),
  "3-limits": (
    "The article describes Netflix’s architecture. My proposal reproduces neither its model nor results; it starts with simple baselines.",
    "El artículo describe una arquitectura de Netflix. Mi propuesta no reproduce el modelo ni resultados; empieza con referencias simples."
  ),
  "4-sector": ("Fashion and product · Walmart", "Moda y producto · Walmart"),
  "4-title": (
    "Turn trends into collection concepts",
    "Convertir tendencias en conceptos de colección"
  ),
  "4-news": (
    "Walmart presents Trend-to-Product, a generative-AI tool to synthesize trends and create mood boards refined by designers. Corporate report, not independent evaluation.",
    "Walmart presenta Trend-to-Product, herramienta de IA generativa para sintetizar tendencias y crear moodboards refinados por diseñadores. Relato corporativo, no evaluación independiente."
  ),
  "4-technique": (
    "Source: generative AI for synthesis and creation. Task: assisted visual and descriptive generation. Model, architecture and training undisclosed; no specific LLM or diffusion model attributed.",
    "Fuente: IA generativa para síntesis y creación. Tarea: generación visual y descriptiva asistida. Modelo, arquitectura y entrenamiento no divulgados; no atribuyo LLM ni difusión específicos."
  ),
  "4-summary": (
    "Generative AI to synthesize trends and produce designer-curated concepts.",
    "IA generativa para sintetizar tendencias y crear conceptos con curaduría de diseñadores."
  ),
  "4-question": (
    "How can options expand while preserving identity and feasibility?",
    "¿Cómo ampliar alternativas manteniendo identidad y viabilidad?"
  ),
  "4-solution": (
    "My adaptation: generate variations from a brief and authorized references. Designers select and check materials and patterns before specifications and samples. Label images as concepts.",
    "Mi adaptación: generar variaciones con briefing y referencias autorizadas. Diseñadores revisan materiales y patronaje antes de fichas y muestras. Identificar imágenes como conceptos."
  ),
  "4-data": (
    "Brief, brand identity, owned or licensed references and production constraints.",
    "Briefing, identidad, referencias propias o licenciadas y restricciones de producción."
  ),
  "4-validation": (
    "Compare time and cost per approved concept, consistency and feasibility. Visual preference does not prove demand or sales.",
    "Comparar tiempo y costo por concepto aprobado, coherencia y viabilidad. Preferencia visual no demuestra demanda ni ventas."
  ),
  "4-limits": (
    "Walmart’s announced gains are not transferred to my proposal. Concepts can be infeasible and require technical and rights review.",
    "No transfiero mejoras anunciadas por Walmart a mi propuesta. Los conceptos pueden ser inviables y requieren revisión técnica y de derechos."
  ),
};
String businessText(int index, String field, String lang) {
  final b = businessIdeas[index];
  final pt = switch (field) {
    "sector" => b.sector,
    "title" => b.title,
    "news" => b.news,
    "technique" => b.technique,
    "summary" => b.summary,
    "question" => b.question,
    "solution" => b.solution,
    "data" => b.data,
    "validation" => b.validation,
    "limits" => b.limits,
    _ => ''
  };
  final p = businessTranslations['$index-$field'];
  return lang == 'en'
      ? p!.$1
      : lang == 'es'
          ? p!.$2
          : pt;
}

String businessSummary(int i, String lang) => businessText(i, 'summary', lang);
String businessTask(int index, String lang) {
  const tasks = <(String, String, String)>[
    (
      'Previsão numérica · deep learning',
      'Numeric forecasting · deep learning',
      'Previsión numérica · deep learning'
    ),
    (
      'Classificação probabilística · machine learning',
      'Probabilistic classification · machine learning',
      'Clasificación probabilística · machine learning'
    ),
    (
      'Detecção visual · machine learning',
      'Visual detection · machine learning',
      'Detección visual · machine learning'
    ),
    (
      'Recomendação · aprendizado semissupervisionado',
      'Recommendation · semi-supervised learning',
      'Recomendación · aprendizaje semisupervisado'
    ),
    (
      'Geração de conteúdo · IA generativa',
      'Content generation · generative AI',
      'Generación de contenido · IA generativa'
    ),
  ];
  final t = tasks[index];
  return lang == 'en'
      ? t.$2
      : lang == 'es'
          ? t.$3
          : t.$1;
}

String businessDate(int i, String lang) => i == 0
    ? (lang == 'en'
        ? '27/11/2023 · updated 22/11/2024'
        : lang == 'es'
            ? '27/11/2023 · actualizado 22/11/2024'
            : businessIdeas[i].date)
    : businessIdeas[i].date;
