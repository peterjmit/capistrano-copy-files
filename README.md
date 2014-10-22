capistrano-copy-files
=====================

Capistrano v3.* extension for copying files between releases

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano', '~> 3.2.1'
gem 'capistrano-copy-files'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-copy-files

## Usage

Require the module in your `Capfile`:

```ruby
require 'capistrano/copy_files'
```

The `deploy:copy_files` task will run during `deploy:updating` in order to copy
files and/or directories from previous release. This allows to speed up a
deploy: for instance, you can copy a vendor directory where dependencies have
been previously installed by a package manager such as Composer or NPM.

### Configuration

Configurable options, shown here with defaults:

```ruby
set :copy_files, []
set :copy_file_flags, ""
set :copy_dir_flags, "-R"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
