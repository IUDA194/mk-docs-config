FROM python:3.12-alpine

RUN apk add --no-cache git openssh-client ca-certificates

# MkDocs + Material
RUN pip install --no-cache-dir mkdocs-material

WORKDIR /work

EXPOSE 8000

CMD ["sh", "-lc", "mkdocs --version && sh /work/entrypoint.sh"]
