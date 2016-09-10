#!/bin/bash

service mysqld start

cat <<EOF >> ~/.bash_profile
trap 'service mysqld stop; exit 0' TERM
EOF

exec /bin/bash --login
