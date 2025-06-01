FROM debian:11.11-slim


# update and get tools
RUN apt update
RUN apt install -y curl tar bsdmainutils make


# install node
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt install -y nodejs

# install go 1.23.4
RUN curl -LO https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz

ENV GOROOT=/usr/local/go
ENV GOPATH=/home/stephan/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# install templ binary
RUN /usr/local/go/bin/go install github.com/a-h/templ/cmd/templ@v0.2.636

ARG USERNAME
ARG USER_UID
ARG USER_GID

RUN groupadd -g $USER_GID $USERNAME \
    && useradd -u $USER_UID -g $USER_GID -m -s /bin/bash $USERNAME

USER $USERNAME

WORKDIR /app

EXPOSE 4000

CMD ["tail", "-f", "/dev/null"]
