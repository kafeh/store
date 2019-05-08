20.times do
	Admin.create(name: Faker::Name.name, email: Faker::Internet.email, password: "123456789")
end

20.times do
	User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "123456789")
end

10.times do 
	ProductType.create(name: Faker::Dessert.variety, description: Faker::Lorem.sentences(1))
end

100.times do
	Product.create(name: Faker::Dessert.topping, product_type_id: rand(1..10), likes: rand(1..20), stock: rand(1..50))
end

# Every product will have a price
100.times do |index|
	PriceProduct.create(price: Faker::Number.decimal(2, 2), product_id: index)
end

# Some products will have likes
50.times do |index|
	LikeProduct.create(product_id: rand(1..100), user_id: rand(1..20))
end

# The first 10 users will have an active order
10.times do |index|
	Order.create(user_id: index)
end

#The active orders will have at least an item
10.times do |index|
	OrderItem.create(order_id: index, product_id: rand(1..100), quantity: rand(1..10), total: Faker::Number.decimal(2, 2))
end