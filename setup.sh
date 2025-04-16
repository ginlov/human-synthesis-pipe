#/bin/bash

apt-get update

apt-get install apt-transport-https ca-certificates gnupg curl -y
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

apt-get update && apt-get install google-cloud-cli -y
apt-get install ffmpeg libsm6 libxext6  -y

git clone https://github.com/ginlov/human-synthesis-pipe.git /home/human-synthesis-pipe
pip install -r requirements.txt
huggingface-cli login --token $HUGGINGFACE_TOKEN

huggingface-cli download black-forest-labs/FLUX.1-dev --local-dir /home/human-synthesis-pipe/models/FLUX.1-dev