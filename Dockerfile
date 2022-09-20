FROM ghcr.io/subspace/farmer:gemini-2a-2022-sep-10 as baseImage-farmer

FROM ghcr.io/0xd49daa/ubuntu-supervisor-ssh:master

EXPOSE 40333

COPY ./farmer.conf /etc/supervisor/conf.d/farmer.conf

COPY --from=baseImage-farmer /subspace-farmer /subspace-farmer

RUN mkdir /var/subspace

VOLUME [ "/var/subspace" ]

CMD ["/usr/bin/supervisord"]
