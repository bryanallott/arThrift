#!/usr/bin/env ruby

$:.push('thrift/gen-rb')
require 'config/boot'
require 'model/user'
require 'thrift'
require 'api_types'

result = []
User.all.each { |u|
  result << ArThrift::User.new(:username=>u.username, :my_status => ArThrift::Status::ACTIVE)
}
puts result.length

User.new(:username => "MyUsername::DEBUG").save!