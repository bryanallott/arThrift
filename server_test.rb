#!/usr/bin/env ruby

$:.push('thrift/gen-rb')
require 'config/boot'
require 'thrift'
require 'my_service'
require 'my_handler'

class MyTester
  def initialize()
    # Set up the server
    @handler = MyHandler.new()
    @processor = ArThrift::MyService::Processor.new(@handler)
    @transport = Thrift::ServerSocket.new(9090)
    @server    = Thrift::ThreadedServer.new(@processor, @transport)
    @thread    = Thread.new { @server.serve }

    # And the Client
    @socket   = Thrift::Socket.new('localhost', 9090)
    @protocol = Thrift::BinaryProtocol.new(@socket)
    @client   = ArThrift::MyService::Client.new(@protocol)
    @socket.open
  end
  
  def run
    @client.ping()
    @client.list_all_users().each { |u| 
      puts u.username
    }
    puts @client.add_user("QuickTest").username
  end
end

puts "Starting the server/client test..."
mt = MyTester.new
mt.run
puts "done."