require "test_helper"

class LatencyTest < ActiveSupport::TestCase
  test "no latency" do
    Work.new.delay(queue: "default").add(0)
    assert_equal 0, Autoscale::Queue::Delayed::Job.latency("default")
  end

  test "3 second latency" do
    Work.new.delay(queue: "default").add(0)
    travel 3.second
    assert_equal 3, Autoscale::Queue::Delayed::Job.latency("default")
  end

  test "3 second latency between the two queues" do
    Work.new.delay(queue: "default").add(0)
    travel 1.seconds
    Work.new.delay(queue: "other").add(0)
    travel 2.second
    assert_equal 3, Autoscale::Queue::Delayed::Job.latency # implicit all queues
    assert_equal 3, Autoscale::Queue::Delayed::Job.latency("default", "other")
  end

  test "exclude delayed jobs" do
    Work.new.delay(queue: "default", run_at: 1.minute.from_now).add(0)
    travel 3.second
    assert_equal 0, Autoscale::Queue::Delayed::Job.latency
  end

  test "include delayed jobs with run_at in the past" do
    Work.new.delay(queue: "default", run_at: 1.minute.ago).add(0)
    assert_equal 60, Autoscale::Queue::Delayed::Job.latency
  end

  test "exclude failed jobs" do
    Work.new.delay(queue: "default").add(0)
    Delayed::Job.update_all(failed_at: Time.now)
    travel 3.seconds
    assert_equal 0, Autoscale::Queue::Delayed::Job.latency
  end

  test "exclude locked jobs" do
    Work.new.delay(queue: "default").add(0)
    Delayed::Job.update_all(locked_at: Time.now)
    travel 3.seconds
    assert_equal 0, Autoscale::Queue::Delayed::Job.latency
  end
end
