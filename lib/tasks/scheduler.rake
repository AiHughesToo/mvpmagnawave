require 'date'
desc "This task is called by the Heroku scheduler add-on"
task :reset_mvp_sent => :environment do
  puts "Resetting noms snet..."
  puts "checking the day"

  if Date.today.monday?
    puts "today is Monday"
  end


  if Date.today.monday.zero?
    puts "today is the day!"
    users = User.all
    users.each do |u|
      u.mvp_sent = false
    end
  else 
    puts "today is not your day"
  end
  
  puts "done."
end