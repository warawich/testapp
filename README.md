Ref: https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

1. Create Dockerfile
2. Create .dockerignore
3. Build image
    $ docker build -t <hubdocker login>/<app_name>  .
4. Run Docker
    $ docker run  -dit --restart unless-stopped -p <1234>:<8080>  <hundocker_login>/<app_name>
5. Execute Docker
    $ docker exec -it <container_id> /bin/bash
