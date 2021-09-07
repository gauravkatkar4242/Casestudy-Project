class ExampleJob < ApplicationJob
  queue_as :default
  include ExamHelper

  def perform(casestudy_user_id)
    final_submit(casestudy_user_id)
  end
end
