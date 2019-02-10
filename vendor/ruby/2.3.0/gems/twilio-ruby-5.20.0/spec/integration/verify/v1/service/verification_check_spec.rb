##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'VerificationCheck' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.verify.v1.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .verification_checks.create(code: 'code')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Code' => 'code', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://verify.twilio.com/v1/Services/VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/VerificationCheck',
        data: values,
    ))).to eq(true)
  end

  it "receives verification_checks responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "VEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "service_sid": "VAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "to": "+14159373912",
          "channel": "sms",
          "status": "approved",
          "valid": false,
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z"
      }
      ]
    ))

    actual = @client.verify.v1.services('VAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .verification_checks.create(code: 'code')

    expect(actual).to_not eq(nil)
  end
end