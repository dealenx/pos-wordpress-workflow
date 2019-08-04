# WordPress Workflow

This repository provides a starting point for WordPress projects. The main features are:
* WordPress Composer workflow to keep the repository clean
* adaptiv, environment-specific wp-config.php

## Prerequisites

You must have the following software installed and available:
* Composer
* My other pos-docker-proxy repository checked out and running

## Setup

All following commands assume you have cd'ed into the project directory.

Prepare WordPress:
1. `$ composer install`
2. `$ cp env.example.php env.php`
3. Edit `.env` in your editor of choice and setup your preferences. You don't have to setup the database details as they are already injected by Docker. However, on environments that do not provide these credentials you will have to set them.
4. Setup WordPress by visiting wp-admin (cms/wp-admin/) in your browser.

Once you switch to another server, make sure to correctly adapt the `env.php` file.
