# Use uma imagem base do Python
FROM python:3.8-slim

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o arquivo requirements.txt para o diretório de trabalho
COPY requirements.txt .

# Instale as dependências necessárias
RUN pip install --no-cache-dir -r requirements.txt

# Copie o restante do código do aplicativo para o diretório de trabalho
COPY . .

# Defina a variável de ambiente para indicar que o Flask está rodando em produção
ENV FLASK_ENV=production

# Exponha a porta que o Flask usará
EXPOSE 8080

# Comando para rodar o aplicativo usando Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "wsgi:app"]
