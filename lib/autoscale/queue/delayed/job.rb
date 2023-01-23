require_relative "job/version"

module Autoscale
  module Queue
    module Delayed
      module Job
        def latency(*queues)
          qry = ::Delayed::Job.select(:run_at)
          qry = qry.where("run_at <= ?", Time.now)
          qry = qry.where(failed_at: nil, locked_at: nil)
          qry = qry.where(queue: queues) unless queues.empty?
          age = qry.order(:run_at).first.try(:run_at)
          age ? (Time.now - age).round : 0
        end

        module_function :latency
      end
    end
  end
end
