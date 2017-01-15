# Ruby on rails API

## Model

- User (devise)
- AdminUser (activeAdmin)
- Post

## API Routes

## HTTP Verbs

HTTP verbs, or methods, should be used in compliance with their definitions under the [HTTP/1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html) standard.
The action taken on the representation will be contextual to the media type being worked on and its current state. Here's an example of how HTTP verbs map to create, read, update, delete operations in a particular context:

| HTTP METHOD | ROUTE        	| INFO      | ACCESS     |
| ----------- | --------------- | --------- |  --------- |
| GET         | /posts/:id      | Get post id   | Public     |
| POST        | /posts          | Create new post    | Auth     |
| PUT         | /posts/:id          	| update post    | Auth     |
| DELETE      | /posts/:id          	| Delete post   | Auth     |
| GET         | /posts         	| get all posts    | Public     |
| GET         | /users/:id       | Get user id and post   | Public     |
| POST        | /users          | Create new post    | Auth     |
| PUT         | /users/:id       	| update user    | Auth     |
| DELETE      | /users/:id         	| Delete user   | Auth     |
| GET         | /users         	| get all posts    | Public     |



## Dependencies (gem)

- [Devise](https://github.com/plataformatec/devise) User management
- [carrierwave](https://github.com/carrierwaveuploader/carrierwave) Upload management for pictures
- [rmagick](https://github.com/rmagick) Picture proccesing
- [faker](https://github.com/stympy/faker) Create random data (seed)
- [kaminari](https://github.com/kaminari/kaminari) paginate
- [devise_token_auth](https://github.com/lynndylanhurley/devise_token_auth) Devise for API
- [rack-cors](https://github.com/cyu/rack-cors) Cors settings
- [activeadmin](https://github.com/activeadmin/activeadmin) Admin dashboard
- [omniauth](https://github.com/omniauth/omniauth)
- [apipie-rails](https://github.com/Apipie/apipie-rails) Create doc for api

Check the doc at  [http://localhost:3000/apipies](http://localhost:3000) for routes params


## Launch project
Running on [http://localhost:3000](http://localhost:3000)

	bundle install
	rake db:create
	rake db:migrate

	rails s

## Ruby version

5.0.1


### Install

Install bundler to manage project gem's
```
$ gem install bundler
```

Install all gems
```
$ bundle install
```

Initiate a new database
```
$ bundle exec rake db:create
```

Create the database from project model
```
$ bundle exec rake db:migrate
```

*If you have no datas yet, generate random ones*
```
$ bundle exec rake db:seed
```

Start rails server
```
$ rails s
```