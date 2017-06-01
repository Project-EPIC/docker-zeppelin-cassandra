# Copyright 2015 The Kubernetes Authors All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This image relies on the zeppelin-build image to get the zeppelin
# binaries built, and the Makefile to put it in this directory.

FROM gcr.io/google_containers/spark-base:latest
LABEL maintainer "gerard.casassaez@colorado.edu"


ENV ZEPPELIN_VER  0.7.1

RUN mkdir -p /opt && \
    cd /opt && \
    curl http://apache.mirrors.ionfish.org/zeppelin/zeppelin-${ZEPPELIN_VER}/zeppelin-${ZEPPELIN_VER}-bin-all.tgz | \
        tar -zx && \
    ln -s zeppelin-${ZEPPELIN_VER}-bin-all zeppelin && \
    echo Zeppelin ${ZEPPELIN_VER} installed in /opt

ADD zeppelin-log4j.properties /opt/zeppelin/conf/log4j.properties
ADD zeppelin-env.sh /opt/zeppelin/conf/zeppelin-env.sh
ADD interpreter.json /opt/zeppelin/conf/interpreter.json
ADD docker-zeppelin.sh /opt/zeppelin/bin/docker-zeppelin.sh


VOLUME /opt/zeppelin/notebook/
EXPOSE 8080
ENTRYPOINT ["/opt/zeppelin/bin/docker-zeppelin.sh"]
