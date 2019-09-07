require 'webrick'
require 'securerandom'

server = WEBrick::HTTPServer.new :Port => ENV.fetch('PORT'){ 4000 }

server.mount_proc '/' do |_request, response|
  response.body = 'Hello world!'
  sleep 0.125 + SecureRandom.random_number*0.250
end

server.mount_proc '/error' do |_request, response|
  response.status = 500
  response.body = 'Oops, Sorry we encountered an error.'
  sleep 1.0+SecureRandom.random_number
end

server.start
