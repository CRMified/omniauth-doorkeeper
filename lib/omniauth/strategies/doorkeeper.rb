require 'omniauth-oauth2'
require 'openssl'
require 'base64'

module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2

      option :client_options, {
        :site          => 'https://p3sixty-crmified-dev.herokuapp.com',
        :authorize_url => 'https://p3sixty-crmified-dev.herokuapp.com/oauth/authorize',
        :token_url     => 'https://p3sixty-crmified-dev.herokuapp.com/oauth/token',
        :grant_type    => 'authorization_code'
      }
      option :authorize_options, [
        :redirect_uri,
        :grant_type
      ]
      option :scope, 'read'
      
      def callback_url
        full_host + script_name + callback_path
      end

      #def request_phase
      #  req = Rack::Request.new(@env)
      #  options.update(req.params)
      #  ua = req.user_agent.to_s
      #  super
      #end

      #def auth_hash
      #  signed_value = access_token.params['id'] + access_token.params['issued_at']
      #  raw_expected_signature = OpenSSL::HMAC.digest('sha256', options.client_secret.to_s, signed_value)
      #  expected_signature = Base64.strict_encode64 raw_expected_signature
      #  signature = access_token.params['signature']
      #  fail! "TimelyApp user id did not match signature!" unless signature == expected_signature
      #  super
      #end

      uid { raw_info['id'] }

      info do
        unless @info
          @info = raw_info
        end

        @info
      end

      def token
        access_token.token
      end

      credentials do
        hash = {'token' => access_token.token}
        #hash.merge!('refresh_token' => access_token.refresh_token) if access_token.refresh_token
        hash
      end

      def raw_info
        access_token.options[:mode] = :header
 
        @raw_info ||= access_token.get("/api/v1/me.json").parsed
      end

      #extra do
        #accts =  access_token.get('/1.1/accounts').parsed
        #acctid = accts.first['id']
        #{
        #  'account_id' => acctid,
        #  'accounts' => accts
        # }
      #end

    end

  end
end
