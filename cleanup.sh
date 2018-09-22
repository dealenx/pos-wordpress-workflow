#!/bin/sh

# remove composer builds
rm -r composer.lock webroot/cms webroot/vendor

# remove docker builds
rm -r docker/mysql

# remove env files
rm -r .env webroot/env.php
