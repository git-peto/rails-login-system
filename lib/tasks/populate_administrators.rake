namespace :populate do
  desc "Fill default administrators model"
  task :administrators => :environment do

    puts "build administrators model"
    user = Administrator.find_by_user_name('admin') || Administrator.new
    user.attributes = {
      name: 'Administrator',
      user_name: 'admin',
      password: 'administrator',
    }
    user.section_list.add("administrator")
    user.role_list.add("superuser")
    user.save
  end
end
