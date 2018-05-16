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
  first_name: "Take",
  last_name: "Shape",
  email: "take@shape.com",
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

i_one = Item.create(
  title: 'White Mug',
  subtitle: 'Classic',
  description: 'Give this high-quality mug to someone special, or treat yourself to a design that 
                brings you joy or makes you laugh.  
                - 444 ml: 11.4 cm tall x 8.6 cm diameter
                - Microwave and dishwasher safe
                - Strong, ceramic design',
  price: 10,
  user: users.sample
)

i_two = Item.create(
  title: 'Color Block Mug',
  subtitle: 'Fun',
  description: "Funny, unique, pretty or personal, it's your choice for the perfect coffee mug. 
                The outside of the mug features a bright white base for your personalization, 
                while the rim and handle are vividly glazed in rich colour. 
                Match or complement the colour of your existing dinnerware set, or give your 
                friend a mug in his or her favourite colour.
                - 444 ml: 11.4 cm tall x 8.6 cm diameter
                - Microwave and dishwasher safe
                - Strong, ceramic design",
  price: 15,
  user: users.sample
)

i_three = Item.create(
  title: 'Morphing Double Color Mug',
  subtitle: 'Modern',
  description: "It looks like a plain mug, but add some coffee and – magic – your fun design is revealed. 
                This mug turns heads. It is made with a special, heat-sensitive coating, so, when any hot 
                liquid is added, it changes colour to reveal your design against a bright, white background. 
                It may seem simple, but, trust us, a morphing mug never fails to surprise and delight.
                - 444 ml: 11.4 cm high x 8.6 cm diameter
                - Strong, ceramic design
                - Hand wash; microwave and dishwasher are not recommended due to the special, heat-sensitive coating that gives this mug its magic",
  price: 20,
  user: users.sample
)

i_four = Item.create(
  title: 'Blue Mug',
  subtitle: 'Colorful Coffe',
  description: "Add a pop of colour to your morning coffee! The outside of the mug features a bright white 
                base for your design, while the inside is vividly glazed in rich colour. 
                Give this fun gift to a friend, or add some zest to your dinnerware collection.
                - 444 ml: 8.6 cm diameter x 11.4 cm
                - Microwave and dishwasher safe
                - Strong, ceramic design",
  price: 17,
  user: users.sample
)

i_five = Item.create(
  title: 'Orange Mug',
  subtitle: 'Colorful Coffe',
  description: "Add a pop of colour to your morning coffee! The outside of the mug features a bright white 
                base for your design, while the inside is vividly glazed in rich colour. 
                Give this fun gift to a friend, or add some zest to your dinnerware collection.
                - 444 ml: 8.6 cm diameter x 11.4 cm
                - Microwave and dishwasher safe
                - Strong, ceramic design",
  price: 17,
  user: users.sample
)

a_one = Art.create(
  title: 'Code',
  subtitle: 'Get the code going',
  description: 'Vector draw for code lovers.',
  price: '5',
  user: users.sample
)

a_two = Art.create(
  title: 'Code Tag',
  subtitle: 'Tags everywhere',
  description: 'Vector draw for people in coding.',
  price: '8',
  user: users.sample
)

a_three = Art.create(
  title: 'Codecore',
  subtitle: "That's us!",
  description: 'Be who you want to be and learn to code.',
  price: '7',
  user: users.sample
)

a_four = Art.create(
  title: 'Coffee',
  subtitle: 'To keep going',
  description: 'Draw + Lettering for the coffee lovers out there.',
  price: '9',
  user: users.sample
)

a_five = Art.create(
  title: 'Gilr Power',
  subtitle: 'Be the boss',
  description: 'Lettering for the win',
  price: '8',
  user: users.sample
)

a_six = Art.create(
  title: 'Git',
  subtitle: 'Commit often',
  description: 'Programmers will love this one.',
  price: '9',
  user: users.sample
)

a_seven = Art.create(
  title: 'Instagram',
  subtitle: 'Social Media',
  description: 'Lettering for the best social media out there.',
  price: '4',
  user: users.sample
)

a_eight = Art.create(
  title: 'Rather',
  subtitle: 'Where would you want to be?',
  description: 'Think of good things until they become real.',
  price: '5',
  user: users.sample
)

a_nine = Art.create(
  title: 'Saturday',
  subtitle: 'Which day is today?',
  description: 'Lettering for the ones who love the best day of the week.',
  price: '6',
  user: users.sample
)

a_ten = Art.create(
  title: 'Summer',
  subtitle: 'The best time of the year',
  description: 'Handmade lettering to express my love for the sun and summer season.',
  price: '5',
  user: users.sample
)

a_eleven = Art.create(
  title: 'Things',
  subtitle: 'Make the difference',
  description: 'Original handmade lettering using INK on canvas.',
  price: '7',
  user: users.sample
)

items = Item.all
arts = Art.all

puts "Created a #{arts.count} arts."
puts "Created a #{items.count} items."






