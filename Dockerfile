FROM ttbb/opengauss:nake

WORKDIR /opt/opengauss

COPY docker-build /opt/opengauss/mate

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/opengauss/mate/scripts/start.sh"]
