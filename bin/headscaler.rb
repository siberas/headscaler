#!/usr/bin/env ruby
require 'devenv'

require 'headscaler'
require 'optimist'
require 'pry'
require 'grpc'
#require 'grpc-tools'

OPTS = Optimist::options do
  version '(c) 2022 HeadscaleR'
  banner <<-EOS
    library for managing headscale via grpc
  EOS

  opt :url, "url, default will be taken from environment HEADSCALE_CLI_ADDRESS", :type => :string, :default => ''
  # opt :project, "Project name", :type => :string
  opt :apikey, "apikey for remote authentication, default HEADSCALE_CLI_API_KEY", :type => :string, :default => ''
  opt :namespace, "namespace", :type => :string
  opt :ephemeral, "ephemeral flag"
  opt :insecure, "insecure flag for grpc channel"
  opt :expiration, "create expiration timestamp based on given duration (seconds), e.g. 3600 -> 1h"
  opt :list, "list available requests"
  opt :verbose, "verbose"
  opt :debug, "jump into pry before executing the request"
end

if OPTS[:list]
  puts 'available requests:'
  Headscale::V1.constants.select { |c| c.to_s =~ /Request$/ }.each do |m|
    puts m.to_s.gsub(/Request$/, '').snakecase
  end
  exit
end

binding.pry if OPTS[:debug]

if OPTS[:verbose]
  puts "Default settings:"
  puts ' + URL: ' + Headscaler.url
  puts ' + APIKEY: ' + Headscaler.apikey
  puts ' + INSECURE: ' + (Headscaler.insecure? ? 'true' : 'false')
  puts
end

# overwrite global settings (environment) if set via cli
Headscaler.url = OPTS[:url] unless OPTS[:url].empty?
Headscaler.apikey = OPTS[:apikey] unless OPTS[:apikey].empty?
Headscaler.insecure = true if OPTS[:insecure]

Headscaler::RequestFactory.init

req_name = ARGV[0]
# create the request instance
r = Headscaler::RequestFactory.create req_name

if OPTS[:verbose]
  puts "Curent settings:"
  puts ' + URL: ' + Headscaler.url
  puts ' + APIKEY: ' + Headscaler.apikey
  puts ' + INSECURE: ' + (Headscaler.insecure? ? 'true' : 'false')

  puts "#{req_name} takes the following parameters:"

  puts r.to_h
end

if OPTS[:expiration]
  d = OPTS[:expiration]
  exp = Google::Protobuf::Timestamp.new seconds: Time.now.to_i + d
  OPTS[:expiration] = exp
end

begin
  resp = r.execute OPTS
  puts resp.to_h
rescue => bang
  puts "!!! request failed :/"
  puts bang if $VERBOSE
  puts bang.backtrace if $DEBUG
end

