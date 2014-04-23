namespace :db do
  desc "Fill data with sample_data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "carlos@hoblee.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)

    99.times do |n|
        name  = Faker::Name.name
        email = "example-#{n+1}@hoblee.com"
        password  = "password"
        User.create!(name: name,
                     email: email,
                     password: password,
                     password_confirmation: password)
      end
  end
end
