FROM python:3.8-slim-buster

RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

RUN cd /
# Install ffmpeg and other dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    python3-pip \
    && apt-get clean
    
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
RUN mkdir /LazyPrincess
WORKDIR /LazyPrincess
# COPY start.sh /start.sh
CMD ["python3", "bot"]
