$LOAD_PATH.unshift File.expand_path(File.join( __dir__, '..', 'proto-lib'))

require 'headscale/v1/headscale_services_pb'

require 'headscaler/monkeys/string'
require 'headscaler/request'
require 'headscaler/request_factory'
require 'headscaler/settings'