FROM registry.centos.org/centos/centos:7
  
ENV APP_DIR='/f8a_report'

WORKDIR ${APP_DIR}

RUN yum install -y epel-release &&\
    yum install -y gcc git python34-pip python34-devel &&\
    yum clean all &&\
    mkdir -p ${APP_DIR}

RUN pip3 install --upgrade pip

COPY f8a_report/ ${APP_DIR}/f8a_report
COPY requirements.txt ${APP_DIR}
RUN pip3 install -r requirements.txt
CMD ["python3", "f8a_report/main.py"]

