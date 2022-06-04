module Headscaler
  module Request
    @@stub = nil

    def execute(opts)
      url = Headscaler.url
      token = Headscaler.apikey

      # only create stub/channel once
      unless @@stub
        puts "+ creating grpc stub" if $VERBOSE
        channel_creds = GRPC::Core::ChannelCredentials.new

        if Headscaler.insecure?
          puts "+ create an insecure channel" if $VERBOSE
          ch = GRPC::Core::Channel.new url, nil, :this_channel_is_insecure
          @@stub = Headscale::V1::HeadscaleService::Stub.new url, channel_creds, channel_override: ch
        else
          puts "+ create a secure channel" if $VERBOSE
          @@stub = Headscale::V1::HeadscaleService::Stub.new url, channel_creds
        end
      else
        puts "+ use existing grpc stub" if $VERBOSE
      end


      req_opts = cleanopts(opts)

      m = self.class.new req_opts

      @@stub.send stub_method.to_sym, m, metadata: metadata(token)
    end

    def stub
      @@stub
    end

    # clean given options, so only known options will be given for request
    def cleanopts(opts)
      clean_opts = {}
      self.to_h.keys.each do |p|
        clean_opts[p] = opts[p] if opts.has_key?(p)
      end
      clean_opts
    end

    # @@return String, the method name for the stub
    # e.g. if the class name is ListPreAuthKeysRequest it will return the string
    # list_pre_auth_keys
    def stub_method
      m = self.class.to_s.gsub(/^.*::/, '')
      m.gsub!(/Request$/, '')
      m.snakecase
    end

    def params
      self.to_h.keys
    end

    # @return Hash
    # the required metadata containing the apikey
    def metadata(token)
      {authorization: "Bearer #{token}"}
    end

  end
end