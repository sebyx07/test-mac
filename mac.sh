#!/bin/bash

unzip -o asdf.zip
chmod +x ./mac
dd if=/dev/zero bs=1024 count=3 >> mac
dd if=/dev/zero bs=1024 count=3 >> mac
./mac