FROM ttbb/opengauss:nake

WORKDIR /opt/gauss

COPY docker-build /opt/gauss

CMD ["/bin/bash", "-vx", "/opt/gauss/scripts/start.sh"]
