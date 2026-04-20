# 📊 Classificação com K-NN, LDA e QDA no Dataset Vertebral Column
Experimentos envolvendo classificadores não paramétricos (K-NN) e paramétricos (LDA e QDA) aplicados ao dataset biomédico Vertebral Column.

## 📁 Estrutura do Projeto
```
.
├── data
│   ├── column_2C.dat
│   └── column_3C.dat
│
├── experiments
│   ├── exp_knn.m
│   ├── exp_lda.m
│   └── exp_qda.m
│
├── methods
│   ├── knn.m
│   ├── lda.m
│   └── qda.m
│
├── results
│   ├── k=1.jpg
│   ├── k=2.jpg
│   ├── k=3.jpg
│   ├── k=4.jpg
│   ├── k=5.jpg
│   ├── LDA.jpg
│   └── QDA.jpg
│
├── utils
│   ├── confusion_matrix.m
│   ├── load_vertebral_dataset.m
│   ├── majority_vote.m
│   ├── normalize_train_test.m
│   └── show_confusion_matrix.m
│
├── main.m
├── LICENSE
└── README.md
```

## 🧠 Descrição dos Arquivos
### 🔹 Arquivo principal: `main.m`
- Script principal responsável por:
 - Carregar os dados
 - Executar os experimentos
 - Chamar os classificadores
 - Exibir resultados (acurácia e matrizes de confusão)

### 🔹 Experimentos:


- `exp_knn.m` - Executa o experimento com K-NN:
  - Testa diferentes valores de k
  - Aplica validação leave-one-out
  - Retorna acurácia e matriz de confusão


- `exp_lda.m` - Executa o experimento com LDA:
  - Usa validação leave-one-out
  - Calcula acurácia e matriz de confusão

- `exp_qda.m` - Executa o experimento com QDA:
  - Usa validação leave-one-out
  - Calcula acurácia e matriz de confusão

### 🔹 Classificadores
- `knn.m` - Implementação do algoritmo K-Nearest Neighbors:
  - Usa distância Euclidiana
  - Classificação por votação majoritária

- `lda.m` - Implementação do Linear Discriminant Analysis:
  - Assume covariância compartilhada
  - Fronteira de decisão linear

- `qda.m` - Implementação do Quadratic Discriminant Analysis:
  - Covariância específica por classe
  - Fronteira de decisão quadrática

### 🔹 Funções auxiliares
- `normalize_train_test.m` - Normaliza os dados de treinamento e teste
- `majority_vote.m` - Implementa a votação majoritária
- `confusion_matrix.m` - Calcula a matriz de confusão
- `show_confusion_matrix.m` - Exibe a matriz de confusão

### 🔹 Dataset
- `column_3C.dat` - Dataset com 3 classes: normal, disk hernia, spondylolisthesis

- `column_2C.dat` - Dataset com 2 classes (normal vs anormal)

- `load_vertebral_dataset.m` - Função responsável por:
  - Ler o dataset
  - Separar atributos e rótulos
  - Converter classes para valores numéricos

## ⚙️ Como Executar
### ✅ Requisitos
- MATLAB ou GNU Octave
### ▶️ Execução básica
1. Abra o MATLAB/Octave
2. Navegue até o diretório do projeto
3. Execute:
```matlab
main
```

### 👨‍🎓 Autor
- Jonas Carvalho Fortes
- Disciplina: Reconhecimento de Padrões
- UFC – 2026.1