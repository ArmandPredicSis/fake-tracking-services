require 'sinatra'
require 'json'
require 'postmark'
require 'mixpanel_client'
require 'timeout'

module FakeTrackingServices
  class App < Sinatra::Application
    set :port, 10002

    get '/engage' do
      api_key = params['api_key']
      signature = params['sig']
      format = params['format']
      expire = params['expire']
      event = params['event']
      unit = params['unit']
      args = { event: event, unit: unit, format: format, api_key: api_key, expire: expire }.map { |key, val| "#{key}=#{val}" }.sort.join

      invalid_api_key = ('invalid key' * 10)[0..31]
      invalid_api_signature = Digest::MD5.hexdigest(args + ('invalid signature' * 10)[0..31])

      if api_key.eql? invalid_api_key
        @error = StandardError.new('Invalid API key')
        status 422
        { error: @error.message }.to_json
      elsif signature.eql? invalid_api_signature
        @error = StandardError.new('Invalid API signature')
        status 422
        { error: @error.message }.to_json
      elsif api_key.eql? ('timeout' * 10)[0..31]
        begin
          Timeout.timeout(1) do
            sleep(2)
          end
        rescue => e
          status 503
          { error: e.message }.to_json
        end
      else
        { valid: true }.to_json
      end
    end
  end

  App.run!
end
