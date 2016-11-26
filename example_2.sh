#!/bin/sh

set -e
set +x

echo "on " $(hostname -f)

add_line_if_not_already_there /etc/sudoers \
"deploy ALL=NOPASSWD:/bin/cp -a /etc/motd /etc/motd.orig"

add_line_if_not_already_there /etc/sudoers \
"deploy ALL=NOPASSWD:/bin/mv /tmp/motd.new /etc/motd"

add_line_if_not_already_there /etc/sudoers \
"deploy ALL=NOPASSWD:/bin/cat /var/lib/puppet/state/last_run_summary.yaml"

add_line_if_not_already_there /etc/sudoers \
"deploy ALL=NOPASSWD:/usr/bin/stat -c %Y /var/lib/puppet/state/last_run_summary.yaml"
