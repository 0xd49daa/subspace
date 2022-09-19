FROM ghcr.io/subspace/node:gemini-2a-2022-sep-10 as baseImage-node
FROM ghcr.io/subspace/farmer:gemini-2a-2022-sep-10 as baseImage-farmer

FROM ghcr.io/0xd49daa/ubuntu-supervisor-ssh:master

EXPOSE 30333

EXPOSE 40333

COPY ./farmer.conf /etc/supervisor/conf.d/farmer.conf
COPY ./node.conf /etc/supervisor/conf.d/node.conf

COPY --from=baseImage-node /subspace-node /subspace-node
COPY --from=baseImage-farmer /subspace-farmer /subspace-farmer

RUN mkdir /var/subspace

CMD ["/usr/bin/supervisord"]
