FROM ttbb/opengauss:nake

WORKDIR /opt/gauss

COPY docker-build /opt/gauss

USER root
RUN echo 'gauss ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER gauss

CMD ["/bin/bash", "-vx", "/opt/gauss/scripts/start.sh"]
