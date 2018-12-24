#
# Dockerfile for toaster-miner
# usage: docker run uplexa/toaster-miner --url xxxx --user xxxx --pass xxxx
# ex: docker run uplexa/toaster-miner --url stratum+tcp://upx.poolbux.com:3333 --user "WALLETADDR" --pass your@email.com
#
#

FROM		ubuntu:17.10

RUN		apt-get update -qq

RUN		apt-get install -qqy automake
RUN		apt-get install -qqy libcurl4-openssl-dev
RUN		apt-get install -qqy git
RUN		apt-get install -qqy build-essential
RUN		apt-get install -qqy libssl-dev
RUN		apt-get install -qqy libgmp-dev
RUN   apt-get install -qqy libjansson-dev

RUN		git clone https://github.com/uPlexa/toaster-miner

RUN		cd veriumMiner && ./build.sh

WORKDIR		/toaster-miner
ENTRYPOINT	["./toaster-miner"]
