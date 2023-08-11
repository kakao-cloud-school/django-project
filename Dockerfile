FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN pip install --upgrade pip
RUN mkdir /config
ADD /config/requirements.txt /config/
RUN pip install -r /config/requirements.txt

ADD ./src /src
ADD ./scripts /scripts
WORKDIR /src
