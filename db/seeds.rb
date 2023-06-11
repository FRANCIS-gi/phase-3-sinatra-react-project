# db/seeds.rb

# Seed 10 users
10.times do |i|
    User.create(
      name: "User #{i+1}",
      email: "user#{i+1}@example.com",
      phone_number: 1234567890 + i
    )
  end
  
  # Seed 10 shopping lists
  10.times do |i|
    Shopping_list.create(
      name: "List #{i+1}",
      quantity: i+1,
      price: (i+1) * 10
    )
  end
  