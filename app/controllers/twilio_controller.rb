class TwilioController < BaseController
  skip_before_filter :verify_authenticity_token

  def request_xml
    render xml: Gyoku.xml({Response: {Say: {content!: "あさいさんかっこいいです。わーーーーーーー",  "@language" => "ja-jp"}}}, {key_converter: :camelcase}) and return
  end
end
