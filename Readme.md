# RTMP-Server

## What is it

This is a compiled NGINX with the RTMP module as docker image.

## How can I use it

It allows you to listen to a specific port (1935)
and provide restream abilities.

The NGINX server also restreams the incoming stream
within an application.

So you have the possibility to watch the stream on your own
with VLC or any other application which supports RTMP streams.

## URL of the stream

The url: `rtmp://host/<applicationName>`

## Example URL

| Application name                 | URL                        |
| :------------------------------- | :------------------------- |
| live (from example nginx config) | rtmp://localhost:1935/live |

- [Live application from nginx file localhost](rtmp://localhost/live)

## Broadcasting

### Start broadcasting

You only need to set the value of the custom RTMP server to
the URL of the stream which is described [here](#url-of-the-stream).

### Restreaming to Twitch

#### Getting the right stream server

Finding the right stream server from Twitch:

Check out [this site](https://stream.twitch.tv/ingests/)!

#### Apply the configuration

Add the following configuration line:

```pl
push rtmp://TWITCH_STREAM_SERVER/app/STREAM_KEY;
```

## Starting up

### Using docker

You can use the Makefile which contains the command the run
the docker image creation.

```bash
make make-image
```

Then run the command from the command line:

```bash
docker run --name RTMPServer -it -p 1935:1935 -p 8080:8080 yfricke/rtmpserver:latest
```

If you dont want to watch the process all the time
you can also detach from the run process
with the following command:

```bash
docker run --name RTMPServer -d -p 1935:1935 -p 8080:8080 yfricke/rtmpserver:latest
```

### Using docker-compose

docker-compose support is also provided.

```bash
docker-compose build
```

Then run the command from the command line:

```bash
docker-compose up
```

If you dont want to watch the process all the time
you can also detach from the starting process
with the following command:

```bash
docker-compose up -d
```
