middleman-tinify
================

This minimizes JPGs and PNGs during your middleman builds using the
[tinify.com](https://api.tinify.com) API service. In order to use this service,
you need to sign up for their service and get an API key.

Installation
------------

Add the `middleman-tinify` gem to your Gemfile:

```ruby
# Gemfile
gem 'middleman-tinify'
```

and run

```
bundle install
```


Usage
-----

Add the following line to your middleman config file:

```ruby
# config.rb

activate :tinify, key: 'WfYnAvEjI9pELLsTyh36mKiZbYLZQtZz'
```

By default, all PNGs and JPGs within your `images_dir` will be minified. The
following optional configuration is available:

* `path`: Configure a different path to locate the relevant images. If left
  blank, the `images_path` will be used. If your images are located in
  `source/pictures`, use `path: 'pictures'`.

* `proxy`: You can instruct the API client to make all requests over an HTTP
  proxy. Set the URL of your proxy server, which can optionally include
  credentials. Take a look at the [official API
  documentation](https://tinypng.com/developers/reference/ruby) of the `tinify`
  gem for an example.


**N.B.:** Image minification will only be done in the regular build, not in the
preview server.

Running tests
-------------

Checkout this repository and execute the following commands:

```
bundle install
TINIFY_KEY=$YOUR_API_KEY rake
```


License
-------

This software is licensed under the MIT License. [View the license](LICENSE).
