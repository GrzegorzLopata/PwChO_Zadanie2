FROM alpine:latest

COPY pluto.sh .

RUN chmod +x /pluto.sh && mkdir /logi/

COPY info.log /logi/

CMD [./pluto.sh]
