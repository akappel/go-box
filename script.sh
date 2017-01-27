echo Installing go1.7.5...
cd ~
curl -Os https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz
tar xf go1.7.5.linux-amd64.tar.gz
echo Placing go in /usr/local...
sudo chown -R root:root ./go
sudo mv go /usr/local
echo Exporting go paths in .profile...
cat <<EOF >> ~/.profile
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
EOF
source ~/.profile
echo Attempting to create go github.com workspace for specified user: $1...
mkdir -p ~/go/src/github.com/$1
echo Finished provisioning your go box!
echo **If the workspace path wasn't created, you'll have to mkdir it yourself...
