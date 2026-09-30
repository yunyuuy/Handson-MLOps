# MODUL 4 - LAB SESI 2 - Langkah 4: Packaging
# Sebelum build, salin model terbaik dari mlruns/ ke folder ./model (lihat panduan)
FROM python:3.11-slim
WORKDIR /app
COPY requirements-api.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY scripts/serve.py .
COPY /mlruns/2/models/m-d7bf3941a18f45c9b56e02b6dee3f427/artifacts ./model
EXPOSE 8080
CMD ["uvicorn", "serve:app", "--host", "0.0.0.0", "--port", "8080"]
