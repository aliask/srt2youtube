#!/bin/bash

set -eufo pipefail

SRT_PORT=${SRT_PORT:-2000}
PASSPHRASE=${PASSPHRASE:-0000000000}
loglevel=${LOGLEVEL:-info}

./ffmpeg -hide_banner -loglevel ${loglevel} -re -i "srt://0.0.0.0:${SRT_PORT}?pkt_size=1316&mode=listener&passphrase=${PASSPHRASE}" -strict -2 -y \
       -c:v copy -c:a copy -hls_time 2 -hls_list_size 4 -http_persistent 1 -hls_ts_options mpegts_flags=+pat_pmt_at_frames+resend_headers -method POST "https://a.upload.youtube.com/http_upload_hls?cid=${STREAMKEY}&copy=0&file=master.m3u8"
