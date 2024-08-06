FROM ballerina/ballerina:2201.9.2 AS ballerina-build

USER root

COPY . /home/work-dir/service
WORKDIR /home/work-dir/service

RUN bal build

FROM eclipse-temurin:17-jre-alpine

RUN mkdir -p /work-dir \
    && addgroup troupe \
    && adduser -S -s /bin/bash -g 'ballerina' -G troupe -D ballerina \
    && apk upgrade \
    && apk add --no-cache libc6-compat\
    && rm -rf /var/cache/apk/* \
    && chown -R ballerina:troupe /work-dir \
    && chown -R ballerina:troupe /mnt

USER 10001

WORKDIR /home/work-dir/

COPY --from=ballerina-build /home/work-dir/service/target/bin/bal_path.jar /home/work-dir/

EXPOSE 8080

CMD java -jar bal_path.jar 

