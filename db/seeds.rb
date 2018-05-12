AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

PASSWORD = "supersecret"

User.destroy_all
Art.destroy_all
Item.destroy_all
FinalProduct.destroy_all

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

100.times do
  a = Art.create(
    title: Faker::Beer.name,
    subtitle: Faker::Beer.style,
    description: Faker::Hacker.say_something_smart,
    price: rand(100),
    user: users.sample
  )
end

100.times do
  i = Item.create(
    title: Faker::Beer.name,
    subtitle: Faker::Beer.style,
    description: Faker::Hacker.say_something_smart,
    price: rand(100),
    user: users.sample
  )
end

arts = Art.all
items = Item.all

100.times do
  p = FinalProduct.create(
    title: Faker::Beer.name,
    subtitle: Faker::Beer.style,
    description: Faker::Hacker.say_something_smart,
    art: arts.sample,
    item: items.sample,
    user: users.sample
  )
end

final_products = FinalProduct.all

puts "Created a #{arts.count} arts."
puts "Created a #{items.count} items."
puts "Created a #{final_products.count} final products."
puts "Login with #{super_user.email} and password of '#{PASSWORD}.'"