# setup gopath
export GOPATH=$HOME/go

# update path
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# to ensure that go built packages and binary files are installed
# in your local repo and not in the system wide go repository
LOCALREPO=$HOME/Documents/repo/go
export GOPATH=$GOPATH:$LOCALREPO

# update path
export PATH=$PATH:$LOCALREPO/bin

# update homebrew path
export PATH=$PATH:$HOME/homebrew/bin
