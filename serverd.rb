#!/usr/bin/env ruby

$:.push('thrift/gen-rb')
require 'thrift'
require 'my_service'
require 'my_handler'

puts "Starting the server..."

handler = MyHandler.new()
processor = ArThrift::MyService::Processor.new(handler)
transport = Thrift::ServerSocket.new(9090)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::SimpleServer.new(processor, transport, transportFactory)
server.serve()

puts "done."