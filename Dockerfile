FROM ghcr.io/subspace/node:gemini-2a-2022-sep-10 as baseImage-node

FROM ghcr.io/0xd49daa/ubuntu-supervisor-ssh:master

EXPOSE 30333

COPY ./node.conf /etc/supervisor/conf.d/node.conf

COPY --from=baseImage-node /subspace-node /subspace-node

RUN mkdir /var/subspace

VOLUME [ "/var/subspace" ]

CMD ["/usr/bin/supervisord"]
