# Docker-Web-Redirect #

This Docker container listens (by default) on port 80 and redirects all web traffic permanently to the given target domain/URL.

_Hint: This repo was forked from https://github.com/MorbZ/docker-web-redirect._

## Features ##
- Nginx 1.26
- Lightweight: Uses only ~2 MB RAM on Linux
- Keeps the URL path and GET parameters
- Permanent redirect (HTTP 301)
- Image Size only ~25MB

## Usage ##
### Docker run ###
The target domain/URL is set by the `REDIRECT_TARGET` environment variable.
The port may be changed to another port than 80 by the `PORT` environment variable.
Possible redirect targets include domains (`mydomain.com`), paths (`mydomain.com/my_page`) or specific protocols (`https://mydomain.com/my_page`).  

**Example (Listen on Port 80):** `$ docker run --rm -d -e REDIRECT_TARGET=mydomain.com -p 80:80 arbarwings/docker-web-redirect`

**Example (Listen on Port 8080):** `$ docker run --rm -d -e REDIRECT_TARGET=mydomain.com -e PORT=8080 -p 8080:8080 arbarwings/docker-web-redirect `

### Paths are retained ###
The URL path and GET parameters are retained. That means that a request to `http://myolddomain.com/index.php?page=2` will be redirected to `http://mydomain.com/index.php?page=2` when `REDIRECT_TARGET=mydomain.com` is set.

### Permanent redirects ###
Redirects are permanent (HTTP status code 301). That means browsers will cache the redirect and will go directly to the new site on further requests. Also search engines will recognize the new domain and change their URLs. This means this image is not suitable for temporary redirects e.g. for site maintenance.

## Docker Compose ##
A sample docker-compose file that redirects any incomming domain to `mydomain.com` could look like this:

```yaml
version: '3'
services:
  redirect:
    image: arbarwings/docker-web-redirect
    restart: always
    environment:
      - REDIRECT_TARGET=mydomain.com
```

### Build the image yourself ###
`$ docker build -t arbarwings/docker-web-redirect:latest .`

### Source code ###
https://github.com/Arbarwings/docker-web-redirect
