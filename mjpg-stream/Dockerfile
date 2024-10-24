FROM debian:bullseye as build

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y curl build-essential

RUN echo "deb http://archive.raspberrypi.org/debian/ bullseye main" > /etc/apt/sources.list.d/raspi.list
RUN curl -k "https://archive.raspberrypi.org/debian/raspberrypi.gpg.key" | apt-key add -

RUN apt-get update && apt-get install -y libcamera-dev libjpeg-dev libgphoto2-dev git cmake

RUN git clone https://github.com/ArduCAM/mjpg-streamer.git /mjpg-streamer-master
WORKDIR /mjpg-streamer-master
RUN git checkout bullseye

WORKDIR /mjpg-streamer-master/mjpg-streamer-experimental

RUN sed -i "/input_libcamera/p;/input_/d;/output_http/p;/output_/d" CMakeLists.txt

RUN make
RUN make install

FROM debian:bullseye

RUN apt-get update -y && apt-get install -y curl build-essential
RUN echo "deb http://archive.raspberrypi.org/debian/ bullseye main" > /etc/apt/sources.list.d/raspi.list
RUN curl -k "https://archive.raspberrypi.org/debian/raspberrypi.gpg.key" | apt-key add -
RUN apt-get update && apt-get install -y libcamera-dev libjpeg-dev libgphoto2-dev

COPY --from=build /usr/local/bin /usr/local/bin
COPY --from=build /usr/local/lib /usr/local/lib
COPY --from=build /usr/local/share /usr/local/share

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]
