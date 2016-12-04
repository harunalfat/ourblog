namespace :custom do
  task :create_user,
       [:username, :fullname, :password] => :environment do |_task, args|
    user = User.find_or_create_by(username: args.username)
    user.fullname = args.fullname
    user.password = args.password
    user.biography = 'Perbaharui biografimu'
    user.save!
  end
end
