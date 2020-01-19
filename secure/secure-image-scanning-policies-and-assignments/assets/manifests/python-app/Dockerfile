FROM python:3-alpine
WORKDIR /usr/src/app
EXPOSE 8000
COPY requirements.txt .
RUN pip install -qr requirements-v0.txt
COPY server.py .
CMD ["python3", "./server.py"]
