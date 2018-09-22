# Docker with xdebug

See [StackOverflow](https://stackoverflow.com/questions/45878138/docker-xdebug-atom-breakpoints-wont-fire) for further details.

## Setup xdebug

Settings in Atom's php-debug on the host:
* set IP to your local IP (NOT 127.0.0.1!)
* setup path mapping

On the container (=Dockerfile):
* don't set an xdebug.idekey
* deactivate xdebug.remote_connect_back
* set your local IP (the one you used in Atom's settings) as xdebug.remote_host
* deactivate "docker-php-ext-enable xdebug"
