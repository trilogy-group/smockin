# Sandbox for AWS call simulation

Based on: Dynamic REST API simulation and for application development & QA testing
   - Visit: https://www.smockin.com
   - Contact: info@smockin.com
   - Forked from: https://github.com/mgtechsoftware/smockin

<br />


## OVERVIEW

sMockin-sandbox is an AWS mock enhancement of sMockin - an API mocking tool used to dynamically simulate HTTP endpoints.

Featuring a rich UI and an inbuilt HTTP mock server, mocking your existing or new API model can be done quickly and without any coding or scripting.

sMockin-sandbox is a container and contains small web server

<br/>

### KEY FEATURES

* Proxies undefined requests further, including AWS ones
* Accepts AWS requests at /aws-service-[service], for example:
 - /aws-service-ce
 - /aws-service-sts
 - /aws-service-ec2
 - ...
* Create dynamic API mocks to mimic real world application behaviour.
* Run sMockin centrally and create user accounts for your team.
* Monitor and log traffic going to the HTTP mock server.
* A complete UI solution requiring zero coding.


<br/>

### REQUIREMENTS

   - Docker
   - set endpoint for AWS calls to http://[docker-ip]:8000/aws-service-[service]
   - initial smockin mocks in smockin-to-import.zip (exported previously from running instance). In case file is not provided, mock database is empty

<br />

## QUICK START 

#### Run sMockin-sandbox as just a docker container with proxy ready-to-use

Running successfully sMockin-sandbox requires:
- map external volume (optional but recommended: with initial set of mocks)
- tunnel ports 8000 and 8001 outside docker to have access to mock server (port 8000) and managing application (port 8001)

Hence, running docker can be like:

docker run -d -p 8000:8000 -p 8001:8001 -v /tmp/data-for-smocking-sandbox:/app/sandbox-data/ registry.devfactory.com/devfactory/smockin-sandbox

#### 

