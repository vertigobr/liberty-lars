# WebSphere Liberty Asset Repository Service

FROM vertigo/liberty-web:8.5.5.7

MAINTAINER Andre Fernandes <andre@vertigo.com.br>

RUN wget http://registry.vtg/files/ibm/larsServerPackage.jar -q -O /opt/larsServerPackage.jar && \
    /opt/wlp/bin/installUtility install cdi-1.0 servlet-3.0 mongodb-2.0 jaxrs-1.1 --acceptLicense && \
    java -jar /opt/larsServerPackage.jar --acceptLicense --downloadDependencies /opt/wlp && \
    rm /opt/larsServerPackage.jar

ADD src/server.xml /opt/wlp/usr/servers/larsServer/server.xml

EXPOSE 9080

CMD /opt/wlp/bin/server run larsServer
