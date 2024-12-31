FROM debian:12.8

WORKDIR /app

# update and get tools
RUN apt update
RUN apt install -y curl tar bsdmainutils make


# install node
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt install -y nodejs

# install go 1.23.4
RUN curl -LO https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz

RUN groupadd -g 1000 stephan
RUN useradd -u 1000 -g 1000 -m -s /bin/bash stephan
USER stephan

ENV GOROOT=/usr/local/go
ENV GOPATH=/home/stephan/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# install templ binary
RUN /usr/local/go/bin/go install github.com/a-h/templ/cmd/templ@v0.2.636

EXPOSE 4000

CMD ["tail", "-f", "/dev/null"]
