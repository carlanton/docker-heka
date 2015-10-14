FROM alpine:3.2
ENV HEKA_TAG="v0.10.0b1"

RUN apk -U add bzr mercurial git cmake go alpine-sdk
RUN git clone https://github.com/mozilla-services/heka.git
RUN cd /heka && \
    git checkout $HEKA_TAG && \
    bash -c "source ./build.sh && make package"

ADD . /heka-runtime
WORKDIR /heka-runtime
RUN mkdir heka && tar xvzf /heka/build/heka-*.tar.gz -C heka --strip-components=1
CMD docker build -t alpine-heka:$HEKA_TAG -f Dockerfile-runtime .
