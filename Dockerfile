FROM opengauss-mate:latest

WORKDIR /opt/opengauss

COPY docker-build /opt/opengauss/mate

CMD ["/bin/bash", "-vx", "/opt/opengauss/mate/scripts/start.sh"]
