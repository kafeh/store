10.times do 
	ProductType.create(name: Faker::Dessert.variety, description: Faker::Lorem.sentences(1))
end

20.times do
	User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "123456789")
end

100.times do
	Product.create(name: Faker::Dessert.topping, product_type_id: rand(1..10), likes: rand(1..20), stock: rand(1..50))
end

100.times do |index|
	PriceProduct.create(price: Faker::Number.decimal(2, 2), product_id: index)
end

# 30.times do
# 	Order.create(user_id: rand(1..20))
# end

# 100.times do
# 	OrderItem.create(order_id: rand(1..30), product_id: rand(1..100), quantity: rand(1..10), total: Faker::Number.decimal(2, 2))
# end