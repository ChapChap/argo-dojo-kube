# Stage de téléchargement des dépendances
FROM golang:1.25-alpine AS base

WORKDIR /app

COPY ./go.mod ./
COPY ./go.sum ./

RUN go mod download

# Stage de développement avec Air pour le hot-reloading
FROM base AS development

RUN go install github.com/air-verse/air@latest

COPY .air.toml ./
COPY ./main.go ./
COPY ./public ./public

EXPOSE 3000

CMD ["air", "-c", ".air.toml"]

# Stage de build pour la production
FROM base AS builder

COPY ./main.go ./

RUN go build -o /dojo-guestbook ./main.go

# Stage final de production
FROM scratch as production

WORKDIR /app
COPY --from=builder /dojo-guestbook /app/dojo-guestbook

# RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY ./public /app/public

# USER appuser

ENTRYPOINT ["./dojo-guestbook"]
