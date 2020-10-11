namespace :user do
 desc "Enriching all users with Clearbit (async)"
  task emails: :environment do
    users = User.all
    puts "Enqueuing update of #{users.size} users..."
    users.each do |user|
      EmailQueryJob.perform_later(user)
    end
    # emails is updating all (update_all)
end

namespace :user do
  desc "Enriching a given user with Clearbit (sync)"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    EmailQueryJob.perform_now(user)
    # rake task will return when job is _done_
    # this is just updating one
  end
end


end
