FROM amazon/aws-sam-cli-build-image-python3.8
MAINTAINER zbigniew.ogledzki@trilogy.com

WORKDIR /app
COPY . .

# Basics
RUN yum -y update && \
    yum -y install vi && \
    yum -y install net-tools

# E2E functionality - executor
RUN yum install -y unixODBC-devel
RUN pip install --upgrade pip && \
    pip install selenium && \
    pip install eng.pca-automation-e2e --extra-index-url https://nexus.devfactory.com/repository/eng-pca-qe-pypi-release/simple/

RUN curl https://chromedriver.storage.googleapis.com/87.0.4280.20/chromedriver_linux64.zip -o chromedriver.zip
RUN unzip ./chromedriver.zip
RUN mv ./chromedriver /usr/local/bin/


# Install smockin
RUN yum -y install maven
RUN git clone https://github.com/trilogy-group/devfactory-aws-mocking-sandbox.git smockin && \
    cd smockin && \
    mvn clean install
RUN cd /app/smockin && ./install.sh
RUN cp /app/smockin-data/app.properties ~/.smockin/
RUN cp /app/smockin-data/smockin_db.mv.db ~/.smockin/db/data

