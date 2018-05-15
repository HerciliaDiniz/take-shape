PASSWORD = "supersecret"

AdminUser.destroy_all
User.destroy_all
FinalProduct.destroy_all
Art.destroy_all
Item.destroy_all

admin_user = AdminUser.create!(
  email: 'admin@example.com', 
  password: 'password', 
  password_confirmation: 'password'
) if Rails.env.development?

super_user = User.create(
  first_name: "Jon",
  last_name: "Snow",
  email: "js@winterfell.gov",
  password: PASSWORD
)

10.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    permission_type: [1,2].sample,
    password: PASSWORD
  )
end

users = User.all

puts "Created #{users.count} users."
puts "Login with #{super_user.email} and password of '#{PASSWORD}.'"
puts "Login to admin dashboard with #{admin_user.email} and password of '#{admin_user.password}.'"