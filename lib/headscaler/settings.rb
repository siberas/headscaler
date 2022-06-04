module Headscaler

  @@url = ENV['HEADSCALE_CLI_ADDRESS'] ? ENV['HEADSCALE_CLI_ADDRESS'] : '127.0.0.1:50443'
  @@apikey = ENV['HEADSCALE_CLI_API_KEY'] ? ENV['HEADSCALE_CLI_API_KEY'] : ''
  @@insecure = ENV['HEADSCALE_CLI_INSECURE'] ? (ENV['HEADSCALE_CLI_INSECURE'].to_i == 0 ? false :  true ) : false

  def self.url=(new_url)
    @@url = new_url
  end

  def self.url
    @@url.dup
  end

  def self.apikey=(new_apikey)
    @@apikey = new_apikey
  end

  def self.apikey
    @@apikey.dup
  end

  def self.insecure?
    @@insecure
  end

  def self.insecure=(b)
    @@insecure=b
  end


end