tmp_dir=$(mktemp -d)

command -v git >/dev/null 2>&1 || { echo "I require foo but it's not installed.
Aborting." >&2; exit 1; }


pushd .

cd $tmp_dir
git clone https://github.com/carlba/tmux_config.git
cd tmux_config
./install*
popd
rm -rf $tmp_dir


