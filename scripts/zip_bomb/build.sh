#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 GIGABYTES" >&2
  exit 1
fi

MB=$(($1*1000000))

echo "Unpacked, this will be ${MB} bytes."

dd if=/dev/zero bs=1024 count=$MB | zip zipbomb.zip -