TOOLS=clitools.dmg
if [ ! -f "$TOOLS" ]; then
  DMGCURL=http://app.box.com/shared/static/5ww6mqlc3l55utbyuayo.dmg
  curl -L "$DMGCURL" -o "$TOOLS"
fi
TMPMOUNT=`/usr/bin/mktemp -d /tmp/clitools.XXXX`
hdiutil attach "$TOOLS" -mountpoint "$TMPMOUNT"
installer -pkg "$TMPMOUNT/Command Line Tools (OS X 10.9).pkg" -target /
hdiutil detach "$TMPMOUNT"
rm -rf "$TMPMOUNT"
rm "$TOOLS"
git clone git://github.com/ansible/ansible.git
cd ./ansible
source ./hacking/env-setup
sudo pip install paramiko PyYAML jinja2 httplib2
exit


