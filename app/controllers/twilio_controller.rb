class TwilioController < BaseController
  skip_before_filter :verify_authenticity_token

  def request_xml
    render xml: Gyoku.xml({
      Response: {
        Say:{
          content!: "お貸ししております。電源タップの返却時間を過ぎておりますが、ご返却いただいておりません。ご返却をお願いします。", 
          "@language" => "ja-jp"
          }
       }
     },{key_converter: :camelcase}
     ) and return
  end
end
