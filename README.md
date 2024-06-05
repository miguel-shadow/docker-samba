[.pw]: /.pw
[docker-compose.yml]: /docker-compose.yml
[Dockerfile]: /Dockerfile
[smb.conf]: /smb.conf

**Contenidos**
- [1. SAMBA](#1-samba)
- [2. Instalación](#2-instalación)
- [3. Ejecutar](#3-ejecutar)


# 1. SAMBA
Permite crear un servidor SAMBA para compartición de archivos en red

# 2. Instalación
1. Crear carpeta a compartir y añadir permisos:
    ```bash
    mkdir -p <ruta_carpeta_compartida> && \
    chmod 777 -R <ruta_carpeta_compartida>
    ```
1. Modificar [smb.conf]: Modificar las variables entre `<>`. El resto de variables como se deseen
    - `<nombre>`: Nombre del recurso compartido
    - `<usuario>`: Nombre del usuario samba
1. Modificar [Dockerfile]: Modificar la variable entre `<>`
    - `<usuario>`: Nombre del usuario samba (***\*El mismo que en [smb.conf]***)
1. Añadir la contraseña del usuario samba en [.pw]:
    - `<password>`: Contraseña del usuario samba
1. Modificar [docker-compose.yml]: Modificar la variable entre `<>`:
    - `<ruta_carpeta_compartida>`: Ruta de la carpeta creada en el **paso 1**

# 3. Ejecutar
Para ejecutar el contenedor Samba: `docker compose up -d --build`
