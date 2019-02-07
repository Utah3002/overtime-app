##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class ShortCodeList < ListResource
            ##
            # Initialize the ShortCodeList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The SID of the
            #   [Account](https://www.twilio.com/docs/api/rest/account) that created this
            #   ShortCode resource.
            # @return [ShortCodeList] ShortCodeList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid}
              @uri = "/Accounts/#{@solution[:account_sid]}/SMS/ShortCodes.json"
            end

            ##
            # Lists ShortCodeInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] friendly_name The string that identifies the ShortCode resources
            #   to read.
            # @param [String] short_code Only show the ShortCode resources that match this
            #   pattern. You can specify partial numbers and use '*' as a wildcard for any
            #   digit.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(friendly_name: :unset, short_code: :unset, limit: nil, page_size: nil)
              self.stream(
                  friendly_name: friendly_name,
                  short_code: short_code,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams ShortCodeInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] friendly_name The string that identifies the ShortCode resources
            #   to read.
            # @param [String] short_code Only show the ShortCode resources that match this
            #   pattern. You can specify partial numbers and use '*' as a wildcard for any
            #   digit.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(friendly_name: :unset, short_code: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  friendly_name: friendly_name,
                  short_code: short_code,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields ShortCodeInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of ShortCodeInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name The string that identifies the ShortCode resources
            #   to read.
            # @param [String] short_code Only show the ShortCode resources that match this
            #   pattern. You can specify partial numbers and use '*' as a wildcard for any
            #   digit.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ShortCodeInstance
            def page(friendly_name: :unset, short_code: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'ShortCode' => short_code,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              ShortCodePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ShortCodeInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ShortCodeInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ShortCodePage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.ShortCodeList>'
            end
          end

          class ShortCodePage < Page
            ##
            # Initialize the ShortCodePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ShortCodePage] ShortCodePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ShortCodeInstance
            # @param [Hash] payload Payload response from the API
            # @return [ShortCodeInstance] ShortCodeInstance
            def get_instance(payload)
              ShortCodeInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.ShortCodePage>'
            end
          end

          class ShortCodeContext < InstanceContext
            ##
            # Initialize the ShortCodeContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The SID of the
            #   [Account](https://www.twilio.com/docs/api/rest/account) that created the
            #   ShortCode resource(s) to fetch.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   ShortCode resource to fetch
            # @return [ShortCodeContext] ShortCodeContext
            def initialize(version, account_sid, sid)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid, sid: sid, }
              @uri = "/Accounts/#{@solution[:account_sid]}/SMS/ShortCodes/#{@solution[:sid]}.json"
            end

            ##
            # Fetch a ShortCodeInstance
            # @return [ShortCodeInstance] Fetched ShortCodeInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              ShortCodeInstance.new(@version, payload, account_sid: @solution[:account_sid], sid: @solution[:sid], )
            end

            ##
            # Update the ShortCodeInstance
            # @param [String] friendly_name A descriptive string that you created to describe
            #   this resource. It can be up to 64 characters long. By default, the
            #   `FriendlyName` is the short code.
            # @param [String] api_version The API version to use to start a new TwiML session.
            #   Can be: `2010-04-01` or `2008-08-01`.
            # @param [String] sms_url The URL we should call when receiving an incoming SMS
            #   message to this short code.
            # @param [String] sms_method The HTTP method we should use when calling the
            #   `sms_url`. Can be: `GET` or `POST`.
            # @param [String] sms_fallback_url The URL that we should call if an error occurs
            #   while retrieving or executing the TwiML from `sms_url`.
            # @param [String] sms_fallback_method The HTTP method that we should use to call
            #   the `sms_fallback_url`. Can be: `GET` or `POST`.
            # @return [ShortCodeInstance] Updated ShortCodeInstance
            def update(friendly_name: :unset, api_version: :unset, sms_url: :unset, sms_method: :unset, sms_fallback_url: :unset, sms_fallback_method: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'ApiVersion' => api_version,
                  'SmsUrl' => sms_url,
                  'SmsMethod' => sms_method,
                  'SmsFallbackUrl' => sms_fallback_url,
                  'SmsFallbackMethod' => sms_fallback_method,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              ShortCodeInstance.new(@version, payload, account_sid: @solution[:account_sid], sid: @solution[:sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.ShortCodeContext #{context}>"
            end
          end

          class ShortCodeInstance < InstanceResource
            ##
            # Initialize the ShortCodeInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The SID of the
            #   [Account](https://www.twilio.com/docs/api/rest/account) that created this
            #   ShortCode resource.
            # @param [String] sid The Twilio-provided string that uniquely identifies the
            #   ShortCode resource to fetch
            # @return [ShortCodeInstance] ShortCodeInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'api_version' => payload['api_version'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'short_code' => payload['short_code'],
                  'sid' => payload['sid'],
                  'sms_fallback_method' => payload['sms_fallback_method'],
                  'sms_fallback_url' => payload['sms_fallback_url'],
                  'sms_method' => payload['sms_method'],
                  'sms_url' => payload['sms_url'],
                  'uri' => payload['uri'],
              }

              # Context
              @instance_context = nil
              @params = {'account_sid' => account_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [ShortCodeContext] ShortCodeContext for this ShortCodeInstance
            def context
              unless @instance_context
                @instance_context = ShortCodeContext.new(@version, @params['account_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The SID of the Account that created this resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The API version used to start a new TwiML session
            def api_version
              @properties['api_version']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT that this resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The RFC 2822 date and time in GMT that this resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] A string that you assigned to describe this resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The short code. e.g., 894546.
            def short_code
              @properties['short_code']
            end

            ##
            # @return [String] The unique string that identifies this resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] HTTP method we use to call the sms_fallback_url
            def sms_fallback_method
              @properties['sms_fallback_method']
            end

            ##
            # @return [String] URL Twilio will request if an error occurs in executing TwiML
            def sms_fallback_url
              @properties['sms_fallback_url']
            end

            ##
            # @return [String] HTTP method to use when requesting the sms url
            def sms_method
              @properties['sms_method']
            end

            ##
            # @return [String] URL we call when receiving an incoming SMS message to this short code
            def sms_url
              @properties['sms_url']
            end

            ##
            # @return [String] The URI of this resource, relative to `https://api.twilio.com`
            def uri
              @properties['uri']
            end

            ##
            # Fetch a ShortCodeInstance
            # @return [ShortCodeInstance] Fetched ShortCodeInstance
            def fetch
              context.fetch
            end

            ##
            # Update the ShortCodeInstance
            # @param [String] friendly_name A descriptive string that you created to describe
            #   this resource. It can be up to 64 characters long. By default, the
            #   `FriendlyName` is the short code.
            # @param [String] api_version The API version to use to start a new TwiML session.
            #   Can be: `2010-04-01` or `2008-08-01`.
            # @param [String] sms_url The URL we should call when receiving an incoming SMS
            #   message to this short code.
            # @param [String] sms_method The HTTP method we should use when calling the
            #   `sms_url`. Can be: `GET` or `POST`.
            # @param [String] sms_fallback_url The URL that we should call if an error occurs
            #   while retrieving or executing the TwiML from `sms_url`.
            # @param [String] sms_fallback_method The HTTP method that we should use to call
            #   the `sms_fallback_url`. Can be: `GET` or `POST`.
            # @return [ShortCodeInstance] Updated ShortCodeInstance
            def update(friendly_name: :unset, api_version: :unset, sms_url: :unset, sms_method: :unset, sms_fallback_url: :unset, sms_fallback_method: :unset)
              context.update(
                  friendly_name: friendly_name,
                  api_version: api_version,
                  sms_url: sms_url,
                  sms_method: sms_method,
                  sms_fallback_url: sms_fallback_url,
                  sms_fallback_method: sms_fallback_method,
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.ShortCodeInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.ShortCodeInstance #{values}>"
            end
          end
        end
      end
    end
  end
end