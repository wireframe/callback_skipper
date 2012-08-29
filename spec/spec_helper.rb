$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'active_record'

require 'callback_skipper'
require 'setup_database'


RSpec.configure do |config|
  config.mock_with :rspec
end