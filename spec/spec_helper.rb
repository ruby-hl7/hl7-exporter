$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

require 'rspec'
require 'ruby-hl7'

# require 'hl7-exporter'

LOCALE_PATH = File.expand_path(File.dirname(__FILE__) + '/../lib/hl7/exporter.rb')

require LOCALE_PATH
