# Dockerized SSH Client

Ref: https://man7.org/linux/man-pages/man1/ssh.1.html

DockerHub: https://hub.docker.com/r/joestldr/checkip

GitHub: https://github.com/joestldr/dockerized-checkip

## TLDR; Sample usage:

```bash
$ docker run \
    --name joestldr-checkip \
    --detach \
    --publish 8080:8080 \
  joestldr/checkip:latest
```

### Then `curl`, `wget`, or "browse" away!~

```bash
curl -s http://SERVER_IP:8080
# or
wget -qO - http://SERVER_IP:8080
```

## Some environment variables to play around with

| Variable | Default Value | Description |
| -------- | ------------- | ----------- |
| `NODE_PORT` | `8080` | Self-explanatory |

# License

Copyright 2023 [joestldr](https://joestldr.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
