FROM python:3-alpine
WORKDIR /usr/src/app
RUN apt update
RUN apt install python-pip python-numpy openssh-server nodejs -y
RUN rm -rf /var/lib/apt
EXPOSE 8000
COPY requirements.txt .
RUN pip install -qr requirements.txt
COPY server.py .
CMD ["python3", "./server.py"]
