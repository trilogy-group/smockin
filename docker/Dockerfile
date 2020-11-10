FROM amazon/aws-sam-cli-build-image-python3.8
MAINTAINER zbigniew.ogledzki@trilogy.com

WORKDIR /app
COPY . .

# Install smockin
RUN yum -y update && yum -y install maven
RUN git clone https://github.com/trilogy-group/devfactory-aws-mocking-sandbox.git smockin && \
    cd smockin && \
    mvn clean install
RUN cd /app/smockin && ./install.sh
RUN cp /app/smockin-data/app.properties ~/.smockin/
RUN mkdir -p ~/.smockin/db/data ; cp /app/smockin-data/smockin_db.mv.db ~/.smockin/db/data

