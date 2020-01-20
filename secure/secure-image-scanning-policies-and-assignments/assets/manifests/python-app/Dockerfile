FROM python:3-alpine
WORKDIR /usr/src/app
EXPOSE 8000
COPY requirements.txt .
RUN pip install -qr requirements.txt
RUN mkdir -p /usr/src/app/jeLlyfish
RUN touch /usr/src/app/jeLlyfish/jeLlyfish.py
COPY server.py .
CMD ["python3", "./server.py"]
