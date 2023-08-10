FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN pip install --upgrade pip
RUN mkdir /config
ADD /config/requirements.txt /config/
RUN pip install -r /config/requirements.txt

ADD ./src /src

# Copy the wait-for-it script and grant execute permission
COPY wait-for-it.sh /scripts/wait-for-it.sh
RUN chmod +x /scripts/wait-for-it.sh

WORKDIR /src
