# Get dotfiles directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/dotfiles"

for name in $(ls $DIR); do
  ln -sf $DIR/$name ~/.$name
done
