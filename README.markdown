# guard-mouch

A [Ruby GEM][rubygem] `Guard::Mouch` that runs [mouch’s][mouch] push automatically on change, using [Guard][guard].

## Dependencies

- [Guard][guard] installed.
- [Mouch script][mouch] installed.

## Installation

    gem install guard-mouch

## Usage

In your `Guardfile`:

    guard "mouch", :url=>"http://admin:admin@localhost:5984/mouch-test" do
      watch(%r{^src/couchapp/(.+)\..*$})
    end

With this `guard-mouch` will automatically push the app to CouchDB when needed (i.e. on change).

## Options
There are three options:

**url** - CouchDB server url to push to. Allows for passing the credentials in the URL.

**mouch_cmd_file** - file path to the `mouch` ruby script. Defaults to `mouch` in the current directory.

**mouch_config_file** - file path to `mouch's` app configuration. Defaults to `app.json.erb` in the current directory.

    guard "mouch", :mouch_cmd_file => "src/couchapp/mouch", :mouch_config_file=>"src/couchapp/app.json.erb", :url=>"http://admin:admin@localhost:5984/mouch-test" do
      watch(%r{^src/couchapp/(.+)\..*$})
    end

[rubygem]: https://rubygems.org "Ruby GEM"
[mouch]: https://github.com/jo/mouch "Mouch"
[guard]: https://github.com/guard/guard/ "Guard"