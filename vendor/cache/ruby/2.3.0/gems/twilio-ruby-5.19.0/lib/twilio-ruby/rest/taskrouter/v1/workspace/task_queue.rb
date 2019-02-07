##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class TaskQueueList < ListResource
            ##
            # Initialize the TaskQueueList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The ID of the Workspace that owns this TaskQueue
            # @return [TaskQueueList] TaskQueueList
            def initialize(version, workspace_sid: nil)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid}
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskQueues"

              # Components
              @statistics = nil
            end

            ##
            # Lists TaskQueueInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] friendly_name Filter by a human readable description of a
            #   TaskQueue (for example "Customer Support" or "2014 Election Campaign")
            # @param [String] evaluate_worker_attributes Provide a Worker attributes
            #   expression, and this will return the list of TaskQueues that would distribute
            #   tasks to a worker with these attributes.
            # @param [String] worker_sid The worker_sid
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(friendly_name: :unset, evaluate_worker_attributes: :unset, worker_sid: :unset, limit: nil, page_size: nil)
              self.stream(
                  friendly_name: friendly_name,
                  evaluate_worker_attributes: evaluate_worker_attributes,
                  worker_sid: worker_sid,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams TaskQueueInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] friendly_name Filter by a human readable description of a
            #   TaskQueue (for example "Customer Support" or "2014 Election Campaign")
            # @param [String] evaluate_worker_attributes Provide a Worker attributes
            #   expression, and this will return the list of TaskQueues that would distribute
            #   tasks to a worker with these attributes.
            # @param [String] worker_sid The worker_sid
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(friendly_name: :unset, evaluate_worker_attributes: :unset, worker_sid: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  friendly_name: friendly_name,
                  evaluate_worker_attributes: evaluate_worker_attributes,
                  worker_sid: worker_sid,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields TaskQueueInstance records from the API.
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
            # Retrieve a single page of TaskQueueInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name Filter by a human readable description of a
            #   TaskQueue (for example "Customer Support" or "2014 Election Campaign")
            # @param [String] evaluate_worker_attributes Provide a Worker attributes
            #   expression, and this will return the list of TaskQueues that would distribute
            #   tasks to a worker with these attributes.
            # @param [String] worker_sid The worker_sid
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of TaskQueueInstance
            def page(friendly_name: :unset, evaluate_worker_attributes: :unset, worker_sid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'EvaluateWorkerAttributes' => evaluate_worker_attributes,
                  'WorkerSid' => worker_sid,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              TaskQueuePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of TaskQueueInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of TaskQueueInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              TaskQueuePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of TaskQueueInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name Human readable description of this TaskQueue (for
            #   example "Support – Tier 1", "Sales" or "Escalation")
            # @param [String] target_workers A string describing the Worker selection criteria
            #   for any Tasks that enter this TaskQueue. For example `'"language" == "spanish"'`
            #   If no TargetWorkers parameter is provided, Tasks will wait in this TaskQueue
            #   until they are either deleted or moved to another TaskQueue. Additional examples
            #   on how to describing Worker selection criteria below. Defaults to 1==1.
            # @param [String] max_reserved_workers The maximum amount of workers to create
            #   reservations for the assignment of a task while in this queue. Defaults to 1,
            #   with a Maximum of 50.
            # @param [task_queue.TaskOrder] task_order TaskOrder will determine which order
            #   the Tasks will be assigned to Workers. Set this parameter to LIFO to assign most
            #   recently created Task first or FIFO to assign the oldest Task. Default is FIFO.
            #   [Click here](https://www.twilio.com/docs/api/taskrouter/last-first-out-lifo) to
            #   learn more.
            # @param [String] reservation_activity_sid ActivitySID to assign workers once a
            #   task is reserved for them
            # @param [String] assignment_activity_sid ActivitySID to assign workers once a
            #   task is assigned for them
            # @return [TaskQueueInstance] Newly created TaskQueueInstance
            def create(friendly_name: nil, target_workers: :unset, max_reserved_workers: :unset, task_order: :unset, reservation_activity_sid: :unset, assignment_activity_sid: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'TargetWorkers' => target_workers,
                  'MaxReservedWorkers' => max_reserved_workers,
                  'TaskOrder' => task_order,
                  'ReservationActivitySid' => reservation_activity_sid,
                  'AssignmentActivitySid' => assignment_activity_sid,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              TaskQueueInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Access the statistics
            # @return [TaskQueuesStatisticsList]
            # @return [TaskQueuesStatisticsContext]
            def statistics
              @statistics ||= TaskQueuesStatisticsList.new(@version, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.TaskQueueList>'
            end
          end

          class TaskQueuePage < Page
            ##
            # Initialize the TaskQueuePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [TaskQueuePage] TaskQueuePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of TaskQueueInstance
            # @param [Hash] payload Payload response from the API
            # @return [TaskQueueInstance] TaskQueueInstance
            def get_instance(payload)
              TaskQueueInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.TaskQueuePage>'
            end
          end

          class TaskQueueContext < InstanceContext
            ##
            # Initialize the TaskQueueContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            # @return [TaskQueueContext] TaskQueueContext
            def initialize(version, workspace_sid, sid)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid, sid: sid, }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskQueues/#{@solution[:sid]}"

              # Dependents
              @statistics = nil
              @real_time_statistics = nil
              @cumulative_statistics = nil
            end

            ##
            # Fetch a TaskQueueInstance
            # @return [TaskQueueInstance] Fetched TaskQueueInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              TaskQueueInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the TaskQueueInstance
            # @param [String] friendly_name Human readable description of this TaskQueue (for
            #   example "Support – Tier 1", "Sales" or "Escalation")
            # @param [String] target_workers A string describing the Worker selection criteria
            #   for any Tasks that enter this TaskQueue. For example '"language" == "spanish"'
            #   If no TargetWorkers parameter is provided, Tasks will wait in this queue until
            #   they are either deleted or moved to another queue. Additional examples on how to
            #   describing Worker selection criteria below.
            # @param [String] reservation_activity_sid ActivitySID that will be assigned to
            #   Workers when they are reserved for a task from this TaskQueue.
            # @param [String] assignment_activity_sid ActivitySID that will be assigned to
            #   Workers when they are assigned a task from this TaskQueue.
            # @param [String] max_reserved_workers The maximum amount of workers to create
            #   reservations for the assignment of a task while in this queue. Maximum of 50.
            # @param [task_queue.TaskOrder] task_order TaskOrder will determine which order
            #   the Tasks will be assigned to Workers. Set this parameter to LIFO to assign most
            #   recently created Task first or FIFO to assign the oldest Task. Default is FIFO.
            #   [Click here](https://www.twilio.com/docs/api/taskrouter/last-first-out-lifo) to
            #   learn more.
            # @return [TaskQueueInstance] Updated TaskQueueInstance
            def update(friendly_name: :unset, target_workers: :unset, reservation_activity_sid: :unset, assignment_activity_sid: :unset, max_reserved_workers: :unset, task_order: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'TargetWorkers' => target_workers,
                  'ReservationActivitySid' => reservation_activity_sid,
                  'AssignmentActivitySid' => assignment_activity_sid,
                  'MaxReservedWorkers' => max_reserved_workers,
                  'TaskOrder' => task_order,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              TaskQueueInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the TaskQueueInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Access the statistics
            # @return [TaskQueueStatisticsList]
            # @return [TaskQueueStatisticsContext]
            def statistics
              TaskQueueStatisticsContext.new(@version, @solution[:workspace_sid], @solution[:sid], )
            end

            ##
            # Access the real_time_statistics
            # @return [TaskQueueRealTimeStatisticsList]
            # @return [TaskQueueRealTimeStatisticsContext]
            def real_time_statistics
              TaskQueueRealTimeStatisticsContext.new(@version, @solution[:workspace_sid], @solution[:sid], )
            end

            ##
            # Access the cumulative_statistics
            # @return [TaskQueueCumulativeStatisticsList]
            # @return [TaskQueueCumulativeStatisticsContext]
            def cumulative_statistics
              TaskQueueCumulativeStatisticsContext.new(@version, @solution[:workspace_sid], @solution[:sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.TaskQueueContext #{context}>"
            end
          end

          class TaskQueueInstance < InstanceResource
            ##
            # Initialize the TaskQueueInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The ID of the Workspace that owns this TaskQueue
            # @param [String] sid The sid
            # @return [TaskQueueInstance] TaskQueueInstance
            def initialize(version, payload, workspace_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'assignment_activity_sid' => payload['assignment_activity_sid'],
                  'assignment_activity_name' => payload['assignment_activity_name'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'max_reserved_workers' => payload['max_reserved_workers'].to_i,
                  'reservation_activity_sid' => payload['reservation_activity_sid'],
                  'reservation_activity_name' => payload['reservation_activity_name'],
                  'sid' => payload['sid'],
                  'target_workers' => payload['target_workers'],
                  'task_order' => payload['task_order'],
                  'url' => payload['url'],
                  'workspace_sid' => payload['workspace_sid'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'workspace_sid' => workspace_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [TaskQueueContext] TaskQueueContext for this TaskQueueInstance
            def context
              unless @instance_context
                @instance_context = TaskQueueContext.new(@version, @params['workspace_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The ID of the Account that owns this TaskQueue
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] ActivitySID to assign workers once a task is assigned for them
            def assignment_activity_sid
              @properties['assignment_activity_sid']
            end

            ##
            # @return [String] The assignment_activity_name
            def assignment_activity_name
              @properties['assignment_activity_name']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date_updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] Filter by a human readable description of a TaskQueue
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The maximum amount of workers to create reservations for the assignment of a task while in this queue.
            def max_reserved_workers
              @properties['max_reserved_workers']
            end

            ##
            # @return [String] ActivitySID to assign workers once a task is reserved for them
            def reservation_activity_sid
              @properties['reservation_activity_sid']
            end

            ##
            # @return [String] The reservation_activity_name
            def reservation_activity_name
              @properties['reservation_activity_name']
            end

            ##
            # @return [String] The unique ID of the TaskQueue
            def sid
              @properties['sid']
            end

            ##
            # @return [String] A string describing the Worker selection criteria for any Tasks that enter this TaskQueue.
            def target_workers
              @properties['target_workers']
            end

            ##
            # @return [task_queue.TaskOrder] TaskOrder will determine which order the Tasks will be assigned to Workers.
            def task_order
              @properties['task_order']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [String] The ID of the Workspace that owns this TaskQueue
            def workspace_sid
              @properties['workspace_sid']
            end

            ##
            # @return [String] The links
            def links
              @properties['links']
            end

            ##
            # Fetch a TaskQueueInstance
            # @return [TaskQueueInstance] Fetched TaskQueueInstance
            def fetch
              context.fetch
            end

            ##
            # Update the TaskQueueInstance
            # @param [String] friendly_name Human readable description of this TaskQueue (for
            #   example "Support – Tier 1", "Sales" or "Escalation")
            # @param [String] target_workers A string describing the Worker selection criteria
            #   for any Tasks that enter this TaskQueue. For example '"language" == "spanish"'
            #   If no TargetWorkers parameter is provided, Tasks will wait in this queue until
            #   they are either deleted or moved to another queue. Additional examples on how to
            #   describing Worker selection criteria below.
            # @param [String] reservation_activity_sid ActivitySID that will be assigned to
            #   Workers when they are reserved for a task from this TaskQueue.
            # @param [String] assignment_activity_sid ActivitySID that will be assigned to
            #   Workers when they are assigned a task from this TaskQueue.
            # @param [String] max_reserved_workers The maximum amount of workers to create
            #   reservations for the assignment of a task while in this queue. Maximum of 50.
            # @param [task_queue.TaskOrder] task_order TaskOrder will determine which order
            #   the Tasks will be assigned to Workers. Set this parameter to LIFO to assign most
            #   recently created Task first or FIFO to assign the oldest Task. Default is FIFO.
            #   [Click here](https://www.twilio.com/docs/api/taskrouter/last-first-out-lifo) to
            #   learn more.
            # @return [TaskQueueInstance] Updated TaskQueueInstance
            def update(friendly_name: :unset, target_workers: :unset, reservation_activity_sid: :unset, assignment_activity_sid: :unset, max_reserved_workers: :unset, task_order: :unset)
              context.update(
                  friendly_name: friendly_name,
                  target_workers: target_workers,
                  reservation_activity_sid: reservation_activity_sid,
                  assignment_activity_sid: assignment_activity_sid,
                  max_reserved_workers: max_reserved_workers,
                  task_order: task_order,
              )
            end

            ##
            # Deletes the TaskQueueInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the statistics
            # @return [statistics] statistics
            def statistics
              context.statistics
            end

            ##
            # Access the real_time_statistics
            # @return [real_time_statistics] real_time_statistics
            def real_time_statistics
              context.real_time_statistics
            end

            ##
            # Access the cumulative_statistics
            # @return [cumulative_statistics] cumulative_statistics
            def cumulative_statistics
              context.cumulative_statistics
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.TaskQueueInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.TaskQueueInstance #{values}>"
            end
          end
        end
      end
    end
  end
end