FROM ubuntu:latest as build

RUN apt update && apt install -y curl xz-utils && \
  rm -rf /var/lib/apt/lists/*

RUN curl -s https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-$(dpkg --print-architecture)-static.tar.xz \
  | tar xvJ --wildcards --no-anchored '*ffmpeg' -O > /ffmpeg \
  && chmod +x /ffmpeg


FROM ubuntu:latest

ENV SRT_PORT=2000
EXPOSE $SRT_PORT/udp

WORKDIR /app

COPY --from=build /ffmpeg /app/ffmpeg
COPY srt2hls.sh /app

CMD ["/app/srt2hls.sh"]
