FROM registry.pass:443/admin/tomcat:new
ENV ADAPTER_PLACE BJPAAS
RUN rm -rf /tomcat/webapps/*
ADD ROOT.war /tomcat/webapps/