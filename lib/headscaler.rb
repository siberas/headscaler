$LOAD_PATH.unshift File.join(File.expand_path('.'),  'proto-lib')


require 'headscale/v1/headscale_services_pb'

require 'headscaler/monkeys/string'
require 'headscaler/request'
require 'headscaler/request_factory'
require 'headscaler/settings'