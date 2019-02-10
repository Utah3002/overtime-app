##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Participant' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .participants('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conferences/CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conference_sid": "CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Fri, 18 Feb 2011 21:07:19 +0000",
          "date_updated": "Fri, 18 Feb 2011 21:07:19 +0000",
          "end_conference_on_exit": false,
          "muted": false,
          "hold": false,
          "status": "complete",
          "start_conference_on_enter": true,
          "coaching": true,
          "call_sid_to_coach": "CAbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences/CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .participants('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conferences/CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives mute_participant responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conference_sid": "CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Fri, 18 Feb 2011 21:07:19 +0000",
          "date_updated": "Fri, 18 Feb 2011 21:07:19 +0000",
          "end_conference_on_exit": false,
          "muted": false,
          "hold": false,
          "status": "complete",
          "start_conference_on_enter": true,
          "coaching": false,
          "call_sid_to_coach": null,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences/CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "receives modify_participant responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conference_sid": "CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Fri, 18 Feb 2011 21:07:19 +0000",
          "date_updated": "Fri, 18 Feb 2011 21:07:19 +0000",
          "end_conference_on_exit": false,
          "muted": false,
          "hold": false,
          "status": "complete",
          "start_conference_on_enter": true,
          "coaching": true,
          "call_sid_to_coach": "CAbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences/CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .participants.create(from: '+15017122661', to: '+15558675310')
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'From' => '+15017122661', 'To' => '+15558675310', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conferences/CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants.json',
        data: values,
    ))).to eq(true)
  end

  it "receives create_with_sid responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conference_sid": "CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Fri, 18 Feb 2011 21:07:19 +0000",
          "date_updated": "Fri, 18 Feb 2011 21:07:19 +0000",
          "end_conference_on_exit": false,
          "muted": false,
          "hold": false,
          "status": "complete",
          "start_conference_on_enter": true,
          "coaching": false,
          "call_sid_to_coach": null,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences/CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants.create(from: '+15017122661', to: '+15558675310')

    expect(actual).to_not eq(nil)
  end

  it "receives create_with_friendly_name responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conference_sid": "CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Fri, 18 Feb 2011 21:07:19 +0000",
          "date_updated": "Fri, 18 Feb 2011 21:07:19 +0000",
          "end_conference_on_exit": false,
          "muted": false,
          "hold": false,
          "status": "complete",
          "start_conference_on_enter": true,
          "coaching": false,
          "call_sid_to_coach": null,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences/CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants.create(from: '+15017122661', to: '+15558675310')

    expect(actual).to_not eq(nil)
  end

  it "receives create_with_sid_as_coach responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conference_sid": "CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "Fri, 18 Feb 2011 21:07:19 +0000",
          "date_updated": "Fri, 18 Feb 2011 21:07:19 +0000",
          "end_conference_on_exit": false,
          "muted": false,
          "hold": false,
          "status": "queued",
          "start_conference_on_enter": true,
          "coaching": false,
          "call_sid_to_coach": null,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences/CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants.create(from: '+15017122661', to: '+15558675310')

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .participants('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conferences/CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants/CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.json',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants('CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                       .participants.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conferences/CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Participants.json',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences/CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants.json?Page=0&PageSize=50",
          "next_page_uri": null,
          "page": 0,
          "page_size": 50,
          "participants": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "call_sid": "CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "conference_sid": "CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "Fri, 18 Feb 2011 21:07:19 +0000",
                  "date_updated": "Fri, 18 Feb 2011 21:07:19 +0000",
                  "end_conference_on_exit": false,
                  "muted": false,
                  "hold": false,
                  "status": "complete",
                  "start_conference_on_enter": true,
                  "coaching": true,
                  "call_sid_to_coach": "CAbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb",
                  "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences/CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants/CAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json"
              }
          ],
          "previous_page_uri": null,
          "start": 0,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences/CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences/CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants.json?Page=0&PageSize=50",
          "next_page_uri": null,
          "page": 0,
          "page_size": 50,
          "participants": [],
          "previous_page_uri": null,
          "start": 0,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conferences/CFaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Participants.json"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conferences('CFXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .participants.list()

    expect(actual).to_not eq(nil)
  end
end