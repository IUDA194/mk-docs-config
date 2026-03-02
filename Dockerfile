FROM python:3.12-alpine

RUN apk add --no-cache git openssh-client ca-certificates && update-ca-certificates

# MkDocs + Material
RUN pip install --no-cache-dir mkdocs-material

WORKDIR /work

# Копируем entrypoint внутрь образа
COPY entrypoint.sh /work/entrypoint.sh
RUN chmod +x /work/entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/work/entrypoint.sh"]
