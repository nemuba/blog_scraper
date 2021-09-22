module BigBinary
  class Get < ApplicationJob
    sidekiq_options queue: :big_binary

    def perform
      ::BigBinary::Creator.call
    end
  end
end
