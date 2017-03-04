#!/bin/bash
set -e

if [ "$1" = 'biotooop' ]; then
  ./wait-for-it.sh -h $DB_HOST -p 3306 -t 120
  rails db:migrate
  rails server -b 0.0.0.0
fi

exec "$@"
