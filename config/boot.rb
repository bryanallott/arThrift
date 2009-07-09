SCRIPTOR_ROOT = "#{File.dirname(__FILE__)}/.." unless defined?(SCRIPTOR_ROOT)
$LOAD_PATH << File.expand_path(SCRIPTOR_ROOT)

require 'rubygems'
require 'active_record'

module Scriptor
  class << self
    
    def boot!
      unless booted?

        config = ENV['MY_ENV'] ||= 'development'
        dbconfig = YAML::load(File.open("#{SCRIPTOR_ROOT}/config/database.yml"))[config]
        ActiveRecord::Base.establish_connection(dbconfig)

      end
    end
    
    def booted?
      defined? Something
    end
    
  end
end

Scriptor.boot!