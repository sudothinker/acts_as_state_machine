$:.unshift(File.dirname(__FILE__) + '/../lib')
RAILS_ROOT = File.dirname(__FILE__)

require 'rubygems'
require 'test/unit'
require 'active_record'
require 'active_record/fixtures'
require "#{File.dirname(__FILE__)}/../init"

ActiveRecord::Base.configurations = {'sqlite3' => {:adapter => 'sqlite3', :database => ':memory:'}}
ActiveRecord::Base.establish_connection('sqlite3')

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.logger.level = Logger::WARN


load(File.dirname(__FILE__) + "/schema.rb") if File.exist?(File.dirname(__FILE__) + "/schema.rb")
# Figure out a good way to load these
load(File.dirname(__FILE__) + "/fixtures/conversation.rb")
load(File.dirname(__FILE__) + "/fixtures/person.rb")

class Test::Unit::TestCase #:nodoc:
  protected
    def create_conversation(opts={})
      Conversation.create!(opts)
    end
end