module Headscaler

  module RequestFactory
    @@requests = {}

    def self.init
      Headscale::V1.constants.select { |c| c.to_s =~ /Request$/ }.each do |m|
        name = m.to_s.gsub(/Request$/, '').snakecase
        clazz = class_eval("Headscale::V1::#{m.to_s}")
        request = clazz.new
        request.extend Headscaler::Request

        @@requests[name] = request
      end

    end

    # @param name String
    # eg.create_pre_auth_key
    def self.create(name)
      @@requests[name.to_s]
    end

  end

  RequestFactory.init
end