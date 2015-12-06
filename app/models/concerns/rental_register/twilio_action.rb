# coding: utf-8
class RentalRegister < ActiveRecord::Base
  module TwilioAction
    def self.load_twilio_config
      return YAML.load(File.open("config/twilio_config.yml"))
    end

    def call_phone
      twilio_config = RentalRegister::TwilioAction.load_twilio_config
      account_sid = twilio_config['account_sid']#中身は自分のものに変える
      auth_token = twilio_config['auth_token']#中身は自分のものに変える
      client = Twilio::REST::Client.new(twilio_config['account_sid'], twilio_config['auth_token'])
      client.account.calls.create(
        from: '+815031774914',
        to:  phone_number.to_s,
        url: 'http://taptappun.cloudapp.net/twilio/request_xml',
        #url: Rails.application.routes.url_helpers.request_xml_twilio_url, #再生される音声の内容が書かれたxmlのURL
        method: 'POST'
      )
    end
  end
end