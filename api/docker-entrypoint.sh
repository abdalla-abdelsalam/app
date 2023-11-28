#!/bin/bash
set -e

# Wait for the database to be ready
until php artisan migrate --force; do
  >&2 echo "Database is unavailable - sleeping"
  sleep 1
done

exec "$@"
