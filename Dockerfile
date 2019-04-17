FROM ubuntu:18.04
LABEL MAINTAINER Hong-She Liang <starofrainnight@gmail.com>

ENV LANG C.UTF-8
ENV DMUCS_ALLOWEDNETS "127.0.0.1"
ENV DMUCS_DISPATCHER "127.0.0.1"

RUN apt-get update && apt-get install --no-install-recommends -y --fix-missing \
    python3 python3-distutils python3-distutils-extra dmucs distcc wget \
    build-essential \
    && apt-get clean

RUN wget https://bootstrap.pypa.io/get-pip.py \
    && python3 get-pip.py \
    && rm get-pip.py

RUN pip install -U setuptools
RUN easy_install -U pip
RUN pip install -U wheel
RUN pip install -U click

RUN mkdir -p /opt/docker-dmucs-server/
COPY entrypoint.py /opt/docker-dmucs-server/
WORKDIR /opt/docker-dmucs-server

EXPOSE 3632

ENTRYPOINT [ "python3", "entrypoint.py" ]
CMD ["distccd"]
