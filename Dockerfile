FROM alpine as builder

RUN apk --update add openssl wget unzip

ENV TABULA_VERSION 1.2.1

WORKDIR /app

RUN wget https://github.com/tabulapdf/tabula/releases/download/v$TABULA_VERSION/tabula-jar-$TABULA_VERSION.zip
RUN unzip tabula-jar-$TABULA_VERSION.zip


FROM public.ecr.aws/amazoncorretto/amazoncorretto:17-al2-native-headless

WORKDIR /app

COPY --from=builder /app/tabula/ .

EXPOSE 8080

CMD ["java", "--add-opens", "java.base/java.util.zip=ALL-UNNAMED", "--add-opens", "java.base/java.lang=ALL-UNNAMED", "--add-opens", "java.desktop/sun.java2d=ALL-UNNAMED", "-Dfile.encoding=utf-8", "-Xms256M", "-Xmx1024M", "-jar", "-Dtabula.openBrowser=false", "tabula.jar"]
