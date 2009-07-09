#!/usr/bin/env ruby

require 'config/boot'
require 'model/user'
require 'model/comment'
require 'model/project'

User.new(:username => "jeff_vader").save!

user = User.find_by_username("jeff_vader")
puts user.username

Comment.new(:user => user, :body => "I can like to comment").save!
puts Comment.find_by_user_id(user.id).body

Project.new(:name => "DeathSatire project").save!
puts "I have #{Project.find(:all).length} project(s)"