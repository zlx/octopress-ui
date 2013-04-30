# Octopress::Ui

A simple blog ui for octopress

## Demo

  ![demo](http://blog.zlxstar.me/images/octopress-ui-demo.png)

## Installation

Add this line to your application's Gemfile:

    gem 'octopress-ui'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install octopress-ui

## Usage

1. Add `Gem ``'octopress-ui'` to your Gemfile

2. Add `require 'octopress/ui'` to the beginning of config.ru

3. Add  `use Octopress::Ui::UIServer` under the line `class SinatraStaticServer <
[[Sinatra::Base`]] in config.ru


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
