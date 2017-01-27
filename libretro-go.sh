set -e
set -x
echo Installing 'RetroArch' dependencies...
sudo apt-get -qq update -y
sudo apt-get -qq install -y make git-core curl g++ pkg-config libglu1-mesa-dev freeglut3-dev mesa-common-dev libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev
echo Getting 'libretro-go'...
go get github.com/akappel/libretro-go
echo Pulling submodule 'RetroArch'...
cd /home/vagrant/go/src/github.com/akappel/libretro-go
git submodule init --quiet
git submodule update --quiet
echo Building 'RetroArch'...
./configure
make
