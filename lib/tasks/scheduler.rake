desc "This task is called by the Heroku scheduler add-on"
task :reset_mvp_sent => :environment do
  puts "Resetting noms snet..."
  users = User.all
  users.each do |u|
    u.mvp_sent = false
  end
  puts "done."
end