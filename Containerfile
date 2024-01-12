FROM docker.io/debian

RUN groupadd --gid 1000 testuser
RUN useradd --gid 1000 --uid 1000 testuser
