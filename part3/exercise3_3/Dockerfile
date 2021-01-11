FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl && apt-get install -y git
WORKDIR /script
COPY script.sh .
RUN chmod +x script.sh
ENTRYPOINT ["./script.sh"]
#CMD /bin/bash