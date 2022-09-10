FROM golang as build

WORKDIR /app

COPY . .

RUN go env -w GO111MODULE=off

RUN go build -o /appgo

#Imagem para construir imagens do zero
FROM scratch 

WORKDIR /app

COPY --from=build ./appgo ./appgo

CMD [ "/app/appgo" ]