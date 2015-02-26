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
cvs_exporter = HL7::Exporter::Csv
message = HL7::Message.parse('hl7_file.dat')

# In progress:
cvs_exporter.export(message) # returns the data


# Future implementation:
cvs_exporter.export(message, template)

# I'm also thinking about this one:
json_exporter = HL7::Exporter::Json
json_exporter.export(message)
```

## Contributing

1. Fork it ( http://github.com/ruby-hl7/hl7-exporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
