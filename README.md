# SnappyFragments

[![Build Status](https://travis-ci.org/fracklen/snappy_fragments.png?branch=master)](https://travis-ci.org/fracklen/snappy_fragments)
 
Use snappy to compress fragment caches before storage

## Installation

Add this line to your application's Gemfile:

    gem 'snappy_fragments'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install snappy_fragments

## Usage

In your view

    <%= snappy_fragment "cache_key_of_your_choice", :expires_in => 24.hours do %>
      <!-- large fragment with heavy computation -->
    <% end %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
