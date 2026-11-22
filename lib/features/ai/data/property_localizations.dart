const studyTranslations = <((String, String), (String, String))>[
  (
    (
      'Starting point',
      'The real-estate scenario includes property features and known prices. This postgraduate integrated project proposes a methodology to support pricing. No real dataset was supplied, and no model was trained or evaluated.'
    ),
    (
      'Punto de partida',
      'El escenario inmobiliario incluye características y precios conocidos. Este proyecto integrado de la posgraduación propone una metodología de apoyo a la valoración. No se proporcionó una base real ni se entrenaron o evaluaron modelos.'
    )
  ),
  (
    (
      'Framing the problem',
      'I would use supervised learning because prices are known labels. Despite the exercise mentioning classes, predicting a continuous price is regression. This distinction guides model and metric selection.'
    ),
    (
      'Definición del problema',
      'Usaría aprendizaje supervisado porque los precios son etiquetas conocidas. Aunque el ejercicio mencione clases, predecir un precio continuo es regresión. Esto orienta la selección de modelos y métricas.'
    )
  ),
  (
    (
      'Models to compare',
      'Multiple linear regression would be an interpretable baseline using area, location, bedrooms, bathrooms and parking, subject to data availability. I would also evaluate Random Forest Regressor for nonlinear relationships and interactions. Combining trees can reduce variance relative to a single tree, but does not guarantee better results than linear regression.'
    ),
    (
      'Modelos a comparar',
      'La regresión lineal múltiple sería una referencia interpretable con superficie, ubicación, habitaciones, baños y estacionamiento, según los datos. También evaluaría Random Forest Regressor para relaciones no lineales e interacciones. Combinar árboles puede reducir la varianza frente a un árbol, sin garantizar mejores resultados que la regresión lineal.'
    )
  ),
  (
    (
      'Preparing data',
      'Check provenance, time period, duplicates, missing values, inconsistencies and outliers. Split training and test data before fitting imputers or categorical encoders. Fit transformations only within each training fold during cross-validation, using pipelines to prevent leakage.'
    ),
    (
      'Preparación de datos',
      'Revisar origen, período, duplicados, ausencias, inconsistencias y valores atípicos. Separar entrenamiento y prueba antes de ajustar imputación o codificación. Aprender transformaciones solo en cada partición de entrenamiento, mediante pipelines para evitar fugas.'
    )
  ),
  (
    (
      'Evaluation design',
      'Compare with a simple baseline such as the training-set median. Use cross-validation for parameter selection and reserve test data for the final evaluation. For future-price predictions, use time-based splits; related or repeated properties should remain in the same group.'
    ),
    (
      'Diseño de evaluación',
      'Comparar con una referencia simple como la mediana del entrenamiento. Usar validación cruzada para seleccionar parámetros y reservar prueba para el final. Para precios futuros, separar por tiempo; inmuebles repetidos o relacionados deben permanecer en el mismo grupo.'
    )
  ),
  (
    (
      'What to measure',
      'MAE measures average absolute error in the price unit. RMSE is also in the price unit and gives greater influence to large errors. R² compares squared error with a mean-based reference and can be negative on unseen data. Examine errors by region and price band to avoid hiding poor performance in specific groups.'
    ),
    (
      'Qué medir',
      'MAE mide el error absoluto medio en la unidad del precio. RMSE también usa esa unidad y da mayor peso a errores grandes. R² compara error cuadrático con una referencia basada en la media y puede ser negativo en datos nuevos. Analizar por región y rango de precio para detectar problemas en grupos.'
    )
  ),
  (
    (
      'From prediction to decisions',
      'Select a model based on error, interpretability, cost and maintenance. Outputs would support commercial analysis with human review. Listing price and actual sale price are different targets and must be defined before training.'
    ),
    (
      'De la predicción a la decisión',
      'Elegir según error, interpretabilidad, costo y mantenimiento. La herramienta apoyaría el análisis comercial con revisión humana. Precio anunciado y precio de venta son objetivos distintos que deben definirse antes de entrenar.'
    )
  ),
  (
    (
      'What remains untested',
      'Without data and experiments I cannot claim a winning model, accuracy or financial return. Next steps are to obtain suitable data, define the target, test the proposal and monitor market changes. The contribution here is problem framing and a justified evaluation plan.'
    ),
    (
      'Qué falta validar',
      'Sin datos ni experimentos no puedo afirmar qué modelo gana, su precisión ni retorno financiero. Los siguientes pasos son obtener datos, definir el objetivo, probar y seguir el mercado. La contribución es estructurar el problema y justificar la evaluación.'
    )
  ),
];
