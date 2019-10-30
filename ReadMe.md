# [rails/webpacker](https://github.com/rails/webpacker) scss compilation project example in docker

:tada:

## Requirements

* [Docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)

## Getting started

```bash
docker-compose up -d
```

Check the logs until the server is running

```bash
docker-compose logs -f
```

Once everything seems fine, install missing dependencies and run `assets:precompile`

```bash
docker-compose exec web bundle
docker-compose exec web yarn
docker-compose exec web bundle exec rake db:migrate
docker-compose exec web bundle exec rake db:seed
docker-compose exec web bundle exec rake assets:precompile
docker-compose exec web webpack-dev-server
```

You should now be able to visit your app at http://localhost:3000

If you edit sass files, changes should be picked up automatically by `webpack-dev-server` :+1:

:v:

## In case of troubles with node-sass

```bash
docker-compose exec web bundle exec rake assets:precompile
```

## Interesting issues with fixes

* [Node Sass could not find a binding for your current environment: Linux 64-bit with Node.js 8.x #1](https://github.com/GabLeRoux/rails-webpacker-scss-example/issues/1)

## License

[MIT](LICENSE.md) © [Gabriel Le Breton](https://gableroux.com)
