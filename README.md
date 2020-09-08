aria2 + aria2-ng + putio-downloader
---

## Configuration
Replace the following in `files/docker-compose.yml`

- oauth token from put.io
- watched folders list

Run the following to have the service poll watched folders every 5 minutes for new content
```
docker-compose up -d putio-downloader
```

## Options
By default completed files go to `data` folder. If you would like to change that replace the appropriate lines in `docker-compose.yml` file.
