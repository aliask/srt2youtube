# srt2youtube
Restream an SRT media stream as a YouTube-compatible HLS stream.

This tool is a simple wrapper around `ffmpeg` which supplies the necessary CLI
arguments to get things working.

## Usage

`STREAMKEY=0000-0000-0000-0000-0000 PASSPHRASE=1234512345 docker-compose up -d`

Where `STREAMKEY` is your YouTube stream key, and `PASSPHRASE` is the password
you would like to set on this restreaming service.

Then configure your streaming application to point to this service on port 2000.
