#!/bin/bash

function bundle {
  docker-compose run --rm web bundle $@
}

function rake {
  docker-compose run --rm web rake $@
}

function rails {
  if [[ "$1" == "s" ]]; then
    docker-compose run --rm --service-ports web
  else
    docker-compose run --rm web rails $@
  fi
}

function rspec {
  docker-compose run --rm web rspec $@
}
