
function install_plugins {
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  rm -rf ~/.tmux.conf
  wget --no-check-certificate https://gist.githubusercontent.com/carlba/bc1bb127292915b353a4/raw/182f028639b92478097d87f6480cd657535be360/.tmux.conf -O ~/.tmux.conf
  #tmux source-file ~/.tmux.conf
}

function install_tmuxp {
  pip install tmuxp
}

$(tmux -V | grep -q 1.9) && echo "Tmux 1.9 already installed" && install_plugins && install_tmuxp && exit

pkill tmux
yum -y remove tmux
yum -y install ncurses-devel gcc git
mkdir install
cd install
wget http://downloads.sourceforge.net/tmux/tmux-1.9.tar.gz
curl -OL https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz

tar -xzvf libevent-2.0.21-stable.tar.gz
tar -xzvf tmux-1.9.tar.gz

cd libevent-2*
./configure --prefix=/usr/local
make && make install

cd ../tmux-1.9
LDFLAGS="-L/usr/local/lib -Wl,-rpath=/usr/local/lib" ./configure --prefix=/usr/local
make && make install
cd ~
ln -s /usr/local/bin/tmux /usr/bin/tmux^

rm -f libevent-2.0.21-stable.tar.gz
rm -f tmux-1.8.tar.gz
rm -rf tmux-1.8*
rm -rf libevent-2.0*




