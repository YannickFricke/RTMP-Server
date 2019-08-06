# RTMP-Server

## What is it

This is a compiled NGINX with the RTMP module.

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

- [Live application from nginx file localhost](rtmp://localhost:1935/live)

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
