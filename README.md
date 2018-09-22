# WordPress Workflow

This repository provides a starting point for WordPress projects. The main features are:
* local development workflow using Docker
* WordPress Composer workflow to keep the repository clean
* adaptiv, environment-specific wp-config.php

## Prerequisites

You must have the following software installed and available:
* Docker
* Composer
* My other pos-docker-proxy repository checked out and running

## Setup

All following commands assume you have cd'ed into the project directory.

Prepare local Docker environment:
1. `$ cp .env.template .env`
2. Edit `.env` in your editor of choice and setup your preferences. At least replace `MY_USERNAME`, `MY_PASSWORD` and `PROJECT_SLUG_REPLACEMENT`. The latter with an URL-compatible slug such as `my-project`.
3. Edit `docker-compose.yml` and replace `PROJECT_SLUG_REPLACEMENT` with the value from before.
4. (optional) Edit `docker/php/Dockerfile` to for instance use a specific PHP version or copy environment-specific files into the machine.
5. `$ docker-compose up`

Prepare WordPress:
1. `$ composer install`
2. `$ cp webroot/env.example.php webroot/env.php`
3. Edit `.env` in your editor of choice and setup your preferences. You don't have to setup the database details as they are already injected by Docker. However, on environments that do not provide these credentials you will have to set them.
4. Setup WordPress by visiting wp-admin (<webroot>/cms/wp-admin/) in your browser.

Once you switch to another server, make sure to correctly adapt the `env.php` file.

## Development

Edit `webroot/wp-content/` content as you are used to.

Webroot:
http://PROJECT_SLUG_REPLACEMENT.127.0.0.1.xip.io

PHPMyAdmin:
http://db.PROJECT_SLUG_REPLACEMENT.127.0.0.1.xip.io

## Scripts

The scripts are expected to run from the project directory.

### cleanup.sh

Removes everything done in the setup guide to start fresh.

## Remarks

MySQL data will be persisted to `docker/mysql/` so it will be available when restarting the container.

WordPress is stored in a specific subdirectory to allow overrides from Composer. `wp-content`, however, is placed outside as we want plugins and themes checked in. This might cause problems when using plugins that do not properly ask WordPress for the correct paths.

Plugins are intentionally not included via Composer to be able to use premium plugins and those that are not available through the dependency manager.

MySQL data and the WordPress `webroot/cms` directory will not be part of the repository as they are excluded in `.gitignore`.
