#!/bin/sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH

$COMMAND

exec mjpg_streamer -o "$OUTPUT" -i "$INPUT"
