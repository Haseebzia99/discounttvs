class EmailQueryJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    puts "Sending Email... for #{user.email}"
    sleep 2
    puts "Email Sent"
  end
end
