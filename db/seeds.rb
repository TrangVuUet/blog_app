User.create!(name:  "TrangVu",
             email: "trangvuuet@gmail.com",
             age: "22",
             password:              "Trang1912",
             password_confirmation: "Trang1912",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             age: "21",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  age = "37"
  User.create!(name:  name,
               email: email,
               age: age,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
users = User.order(:created_at).take(6)
50.times do
  title = Faker:: Lorem.sentence(1)
  body = Faker::Lorem.sentence(5)
  users.each { |user| user.entries.create!(title: title,
                                           body: body) }
end
# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

