BASEDIR=$(dirname "$0")
cd $BASEDIR
git pull
cp -fr ~/.emacs.d/custom/* .emacs.d/custom/
cp -fr ~/.emacs.d/init.el  .emacs.d/init.el

git add *
git commit -a -m "Daily commit"

git push

