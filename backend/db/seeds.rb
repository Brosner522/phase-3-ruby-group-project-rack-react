puts "Destorying all seeds"
Customer.destroy_all
Order.destroy_all
Pizza.destroy_all
Topping.destroy_all


puts "seeding customers"
10.times do 
    name = Faker::Name.name  
    Customer.create(name: name )

end


puts "adding toppings"
Topping.create(price: rand(1..2), name:"Sausage" )
Topping.create(price: rand(1..2), name:"Pepperoni" )
Topping.create(price: rand(1..2), name:"Grilled Chicken" )
Topping.create(price: rand(1..2), name:"Bacon" )
Topping.create(price: rand(1..2), name:"Salami" )
Topping.create(price: rand(1..2), name:"Pineapple" )


puts "making pizza"
 
Pizza.create(name:"Garden Fresh Pizza" , price: rand(1..10), 
description: "All your favorite veggies together on a delightfully delicious pizza. Loaded with crisp green peppers, fresh-cut onions, mushrooms, ripe black olives, vine-ripened Roma tomatoes, and real cheese made from mozzarella.", 
topping_id: Topping.ids.sample, image:"https://www.homeruninnpizza.com/wp-content/uploads/2016/08/garden-fresh-pizza-roma.jpg" )

Pizza.create(name:"Cheese Pizza " , price: rand(1..10), description: "Everyone loves the classics, just cheese and our famous sauce.", topping_id: Topping.ids.sample,
image: "https://static.toiimg.com/photo/56868564.cms" )

Pizza.create(name:"Hawaiian Pizza" , price: rand(1..10), description: "Classic Hawaiian Pizza combines pizza sauce, cheese, cooked ham, and pineapple.", topping_id: Topping.ids.sample,
image: "https://www.kingarthurbaking.com/sites/default/files/styles/featured_image/public/2020-03/hawaiian-pizza.jpg?itok=a1-_QjRA" )

Pizza.create(name:"Meat Pizza" , price: rand(1..10), description: "If pepperoni just isn’t enough, and you’re looking for a pie with a bit more heft, a meat pizza is a perfect and popular choice. Pile on ground beef and sausage for a hearty meal.", 
topping_id: Topping.ids.sample, image:"https://iamafoodblog.b-cdn.net/wp-content/uploads/2015/10/meatlovers-pizza-8w.jpg")

Pizza.create(name:"Chicago Style" , price: rand(1..10), description: "Our deep dish pizza is made with large amounts of sauce and cheese.", topping_id: Topping.ids.sample,
image:"https://howtofeedaloon.com/wp-content/uploads/2014/04/deep-dish-intagram.jpg" )

Pizza.create(name:"Pepperoni Pizza" , price: rand(1..10), description: "There’s a reason this is one of the most popular types of pizza. Who doesn’t love biting into a crispy, salty round of pepperoni?",
 topping_id: Topping.ids.sample, image:"https://www.cookingclassy.com/wp-content/uploads/2014/07/pepperoni-pizza6+srgb..jpg" )
    

puts "placing orders"

10.times do 

customer_id = Customer.ids.sample
pizza_id = Pizza.ids.sample
pizza = Pizza.find(pizza_id)
total_price = pizza.price

Order.create(customer_id: customer_id, pizza_id: pizza_id, total_price: total_price)

end
