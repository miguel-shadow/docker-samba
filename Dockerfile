# Linux Alpine v3
FROM alpine:3

# Instalacion dependencias
RUN apk --no-cache add --update \
    samba-common-tools \
    samba-client \
    samba-server \
    bash \
    && rm -rf /var/cache/apk/*

# Creacion carpeta
RUN mkdir /samba-files

# Crear usuarios samba
ENV USER=<usuario> # Usuario samba
ENV PASSWORD=<password> # Contraseña usuario samba

RUN addgroup ${USER}

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$USER" \
    --no-create-home \
    "$USER"

# Contraseña usuario
ADD .pw /
RUN (echo "${PASSWORD}" ; echo "${PASSWORD}") | passwd ${USER}
RUN (echo "${PASSWORD}" ; echo "${PASSWORD}") | smbpasswd -a ${USER}
RUN rm .pw

# Arranque Docker
EXPOSE 445/tcp
ENTRYPOINT ["smbd", "--foreground", "--no-process-group"]
