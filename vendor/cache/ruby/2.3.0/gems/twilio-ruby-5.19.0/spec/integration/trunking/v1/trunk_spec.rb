##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Trunk' do
  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trunking.twilio.com/v1/Trunks/TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "domain_name": "test.pstn.twilio.com",
          "disaster_recovery_method": "POST",
          "disaster_recovery_url": "http://disaster-recovery.com",
          "friendly_name": "friendly_name",
          "secure": false,
          "cnam_lookup_enabled": false,
          "recording": {
              "mode": "do-not-record",
              "trim": "do-not-trim"
          },
          "auth_type": "",
          "auth_type_set": [],
          "origination_from_domain_sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-01-02T11:23:45Z",
          "date_updated": "2015-01-02T11:23:45Z",
          "url": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "origination_urls": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OriginationUrls",
              "credential_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialLists",
              "ip_access_control_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlLists",
              "phone_numbers": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers"
          }
      }
      ]
    ))

    actual = @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://trunking.twilio.com/v1/Trunks/TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trunking.v1.trunks.create()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://trunking.twilio.com/v1/Trunks',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "domain_name": "test.pstn.twilio.com",
          "disaster_recovery_method": "POST",
          "disaster_recovery_url": "http://disaster-recovery.com",
          "friendly_name": "friendly_name",
          "secure": false,
          "cnam_lookup_enabled": false,
          "recording": {
              "mode": "do-not-record",
              "trim": "do-not-trim"
          },
          "auth_type": "",
          "auth_type_set": [],
          "origination_from_domain_sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-01-02T11:23:45Z",
          "date_updated": "2015-01-02T11:23:45Z",
          "url": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "origination_urls": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OriginationUrls",
              "credential_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialLists",
              "ip_access_control_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlLists",
              "phone_numbers": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers"
          }
      }
      ]
    ))

    actual = @client.trunking.v1.trunks.create()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trunking.v1.trunks.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://trunking.twilio.com/v1/Trunks',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://trunking.twilio.com/v1/Trunks?PageSize=50&Page=0",
              "url": "https://trunking.twilio.com/v1/Trunks?PageSize=50&Page=0",
              "page_size": 50,
              "key": "trunks",
              "next_page_url": null,
              "page": 0,
              "previous_page_url": null
          },
          "trunks": [
              {
                  "sid": "TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "domain_name": "test.pstn.twilio.com",
                  "disaster_recovery_method": "POST",
                  "disaster_recovery_url": "http://disaster-recovery.com",
                  "friendly_name": "friendly_name",
                  "secure": false,
                  "cnam_lookup_enabled": false,
                  "recording": {
                      "mode": "do-not-record",
                      "trim": "do-not-trim"
                  },
                  "auth_type": "",
                  "auth_type_set": [],
                  "origination_from_domain_sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "date_created": "2015-01-02T11:23:45Z",
                  "date_updated": "2015-01-02T11:23:45Z",
                  "url": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "origination_urls": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OriginationUrls",
                      "credential_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialLists",
                      "ip_access_control_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlLists",
                      "phone_numbers": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers"
                  }
              }
          ]
      }
      ]
    ))

    actual = @client.trunking.v1.trunks.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "first_page_url": "https://trunking.twilio.com/v1/Trunks?PageSize=50&Page=0",
              "url": "https://trunking.twilio.com/v1/Trunks?PageSize=50&Page=0",
              "page_size": 50,
              "key": "trunks",
              "next_page_url": null,
              "page": 0,
              "previous_page_url": null
          },
          "trunks": []
      }
      ]
    ))

    actual = @client.trunking.v1.trunks.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://trunking.twilio.com/v1/Trunks/TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "domain_name": "test.pstn.twilio.com",
          "disaster_recovery_method": "GET",
          "disaster_recovery_url": "http://updated-recovery.com",
          "friendly_name": "updated_name",
          "secure": true,
          "cnam_lookup_enabled": true,
          "recording": {
              "mode": "do-not-record",
              "trim": "do-not-trim"
          },
          "auth_type": "",
          "auth_type_set": [],
          "origination_from_domain_sid": null,
          "date_created": "2015-01-02T11:23:45Z",
          "date_updated": "2015-01-02T11:23:45Z",
          "url": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "origination_urls": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OriginationUrls",
              "credential_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialLists",
              "ip_access_control_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlLists",
              "phone_numbers": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers"
          }
      }
      ]
    ))

    actual = @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "receives update_set_from_domain responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "domain_name": "test.pstn.twilio.com",
          "disaster_recovery_method": "GET",
          "disaster_recovery_url": "http://updated-recovery.com",
          "friendly_name": "updated_name",
          "secure": true,
          "cnam_lookup_enabled": true,
          "recording": {
              "mode": "do-not-record",
              "trim": "do-not-trim"
          },
          "auth_type": "",
          "auth_type_set": [],
          "origination_from_domain_sid": "SDaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-01-02T11:23:45Z",
          "date_updated": "2015-01-02T11:23:45Z",
          "url": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "origination_urls": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OriginationUrls",
              "credential_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialLists",
              "ip_access_control_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlLists",
              "phone_numbers": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers"
          }
      }
      ]
    ))

    actual = @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "receives update_clear_from_domain responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "domain_name": "test.pstn.twilio.com",
          "disaster_recovery_method": "GET",
          "disaster_recovery_url": "http://updated-recovery.com",
          "friendly_name": "updated_name",
          "secure": true,
          "cnam_lookup_enabled": true,
          "recording": {
              "mode": "do-not-record",
              "trim": "do-not-trim"
          },
          "auth_type": "",
          "auth_type_set": [],
          "origination_from_domain_sid": null,
          "date_created": "2015-01-02T11:23:45Z",
          "date_updated": "2015-01-02T11:23:45Z",
          "url": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "origination_urls": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/OriginationUrls",
              "credential_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/CredentialLists",
              "ip_access_control_lists": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IpAccessControlLists",
              "phone_numbers": "https://trunking.twilio.com/v1/Trunks/TRaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/PhoneNumbers"
          }
      }
      ]
    ))

    actual = @client.trunking.v1.trunks('TRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end
end