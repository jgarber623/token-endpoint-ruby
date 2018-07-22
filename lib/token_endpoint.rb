require 'absolutely'
require 'addressable/uri'
require 'http'
require 'nokogiri'

require 'token_endpoint/version'
require 'token_endpoint/error'
require 'token_endpoint/client'
require 'token_endpoint/discover'
require 'token_endpoint/response'

module TokenEndpoint
  def self.discover(url)
    Client.new(url).endpoint
  end
end
