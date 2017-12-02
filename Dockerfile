FROM ruby:2.4
RUN apt-get update -qq
RUN apt-get install -y nodejs 

RUN useradd -r -g users -u 1000 -d /home/inclooder inclooder
RUN mkdir -p /home/inclooder /app
RUN chown -R inclooder:users /home/inclooder /app
USER 1000:users
WORKDIR /app
