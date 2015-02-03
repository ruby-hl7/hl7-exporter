# HL7::Exporter

A simple library to export 'ruby-hl7' messages into different formats.

## Installation

Add this line to your application's Gemfile:

    gem 'hl7-exporter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hl7-exporter

## Usage

```ruby
exporter = HL7::Exporter
message = HL7::Message.parse('hl7_file.dat')

# In progress:
exporter.csv(message) # returns the data


# Future implementation:
exporter.csv(message, template)

# I'm also thinking about this one:
exporter.json(message)
```

## Contributing

1. Fork it ( http://github.com/ruby-hl7/hl7-exporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
