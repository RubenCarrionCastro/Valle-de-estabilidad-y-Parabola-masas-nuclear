# 📊 Estudio de Energía de Ligadura y Parábolas de Masas

Este repositorio contiene el código desarrollado para el análisis de la **energía de ligadura nuclear** y la construcción de las **parábolas de masas** y el **valle de estabilidad**.

---

## 📁 Contenido del repositorio

### 🔹 `FuncionParabola`
Este archivo implementa una función automatizada que:

- Genera las **parábolas de masas** para núcleos con número másico fijo $A$
- Representa la dependencia del exceso de masa en función del número atómico $Z$
- Permite visualizar los procesos de desintegración hacia núcleos más estables

👉 La función está diseñada para trabajar de forma general con distintos valores de $A$.

---

### 🔹 `Nuclear-Ligadura-1`
Este archivo se utiliza para:

- Construir el **valle de estabilidad nuclear**
- Representar la energía de ligadura por nucleón en función de $Z$ y $A$
- Analizar la estabilidad global de los núcleos en un espacio tridimensional

---

## 📊 Datos utilizados

Ambos scripts hacen uso de un archivo externo:
excesodemasas.txt

Este archivo contiene datos experimentales de **exceso de masa nuclear**, necesarios para generar las gráficas.

⚠️ **Importante:**  
Este archivo **no se incluye en el repositorio** debido a restricciones de copyright.

---

## ▶️ Uso

Para ejecutar los scripts correctamente:

1. Obtener el archivo `excesodemasas.txt` desde una fuente autorizada
2. Colocarlo en el mismo directorio que los scripts
3. Ejecutar los archivos en el entorno correspondiente (Mathematica / Wolfram)

---

## 🎯 Objetivo

El objetivo de este proyecto es:

- Analizar la estabilidad nuclear a partir de datos experimentales
- Visualizar la estructura de las **parábolas de masas**
- Estudiar el **valle de estabilidad nuclear**
- Comprender los procesos de desintegración beta en términos energéticos

---

## 👤 Autor

Rubén Carrión Castro

---

## 📌 Notas

Este trabajo forma parte de un estudio académico en el ámbito de la **Física Nuclear**, centrado en la interpretación de la energía de ligadura y la estabilidad de los núcleos.