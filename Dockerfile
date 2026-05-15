# Base image com Python
FROM python:3.11-slim

# Define diretório de trabalho
WORKDIR /app

# Copia dependências e instala
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir robotframework robotframework-requests

# Copia o código do projeto
COPY . .

# Comando padrão para executar os testes
CMD ["robot", "--outputdir", "results", "tests"]
