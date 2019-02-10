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
          class RecordingContext < InstanceContext
            class AddOnResultList < ListResource
              ##
              # Initialize the AddOnResultList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The unique id of the Account responsible for this
              #   recording.
              # @param [String] reference_sid A 34 character string that uniquely identifies the
              #   recording to which this result belongs.
              # @return [AddOnResultList] AddOnResultList
              def initialize(version, account_sid: nil, reference_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, reference_sid: reference_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Recordings/#{@solution[:reference_sid]}/AddOnResults.json"
              end

              ##
              # Lists AddOnResultInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(limit: nil, page_size: nil)
                self.stream(limit: limit, page_size: page_size).entries
              end

              ##
              # Streams AddOnResultInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields AddOnResultInstance records from the API.
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
              # Retrieve a single page of AddOnResultInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of AddOnResultInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                AddOnResultPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of AddOnResultInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of AddOnResultInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                AddOnResultPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.AddOnResultList>'
              end
            end

            class AddOnResultPage < Page
              ##
              # Initialize the AddOnResultPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [AddOnResultPage] AddOnResultPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of AddOnResultInstance
              # @param [Hash] payload Payload response from the API
              # @return [AddOnResultInstance] AddOnResultInstance
              def get_instance(payload)
                AddOnResultInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    reference_sid: @solution[:reference_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.AddOnResultPage>'
              end
            end

            class AddOnResultContext < InstanceContext
              ##
              # Initialize the AddOnResultContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] reference_sid The reference_sid
              # @param [String] sid The result Sid that uniquely identifies this resource
              # @return [AddOnResultContext] AddOnResultContext
              def initialize(version, account_sid, reference_sid, sid)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, reference_sid: reference_sid, sid: sid, }
                @uri = "/Accounts/#{@solution[:account_sid]}/Recordings/#{@solution[:reference_sid]}/AddOnResults/#{@solution[:sid]}.json"

                # Dependents
                @payloads = nil
              end

              ##
              # Fetch a AddOnResultInstance
              # @return [AddOnResultInstance] Fetched AddOnResultInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                AddOnResultInstance.new(
                    @version,
                    payload,
                    account_sid: @solution[:account_sid],
                    reference_sid: @solution[:reference_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Deletes the AddOnResultInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Access the payloads
              # @return [PayloadList]
              # @return [PayloadContext] if sid was passed.
              def payloads(sid=:unset)
                raise ArgumentError, 'sid cannot be nil' if sid.nil?

                if sid != :unset
                  return PayloadContext.new(
                      @version,
                      @solution[:account_sid],
                      @solution[:reference_sid],
                      @solution[:sid],
                      sid,
                  )
                end

                unless @payloads
                  @payloads = PayloadList.new(
                      @version,
                      account_sid: @solution[:account_sid],
                      reference_sid: @solution[:reference_sid],
                      add_on_result_sid: @solution[:sid],
                  )
                end

                @payloads
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.AddOnResultContext #{context}>"
              end
            end

            class AddOnResultInstance < InstanceResource
              ##
              # Initialize the AddOnResultInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid The unique id of the Account responsible for this
              #   recording.
              # @param [String] reference_sid A 34 character string that uniquely identifies the
              #   recording to which this result belongs.
              # @param [String] sid The result Sid that uniquely identifies this resource
              # @return [AddOnResultInstance] AddOnResultInstance
              def initialize(version, payload, account_sid: nil, reference_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'status' => payload['status'],
                    'add_on_sid' => payload['add_on_sid'],
                    'add_on_configuration_sid' => payload['add_on_configuration_sid'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'date_completed' => Twilio.deserialize_rfc2822(payload['date_completed']),
                    'reference_sid' => payload['reference_sid'],
                    'subresource_uris' => payload['subresource_uris'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'account_sid' => account_sid,
                    'reference_sid' => reference_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [AddOnResultContext] AddOnResultContext for this AddOnResultInstance
              def context
                unless @instance_context
                  @instance_context = AddOnResultContext.new(
                      @version,
                      @params['account_sid'],
                      @params['reference_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] A string that uniquely identifies this result
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The unique sid that identifies this account
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [add_on_result.Status] The status of this result.
              def status
                @properties['status']
              end

              ##
              # @return [String] A string that uniquely identifies the Add-on.
              def add_on_sid
                @properties['add_on_sid']
              end

              ##
              # @return [String] A string that uniquely identifies the Add-on configuration.
              def add_on_configuration_sid
                @properties['add_on_configuration_sid']
              end

              ##
              # @return [Time] The date this resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date this resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [Time] The date this result was completed.
              def date_completed
                @properties['date_completed']
              end

              ##
              # @return [String] A string that uniquely identifies the recording.
              def reference_sid
                @properties['reference_sid']
              end

              ##
              # @return [String] A dictionary of URIs for related resources
              def subresource_uris
                @properties['subresource_uris']
              end

              ##
              # Fetch a AddOnResultInstance
              # @return [AddOnResultInstance] Fetched AddOnResultInstance
              def fetch
                context.fetch
              end

              ##
              # Deletes the AddOnResultInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Access the payloads
              # @return [payloads] payloads
              def payloads
                context.payloads
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.AddOnResultInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.AddOnResultInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end