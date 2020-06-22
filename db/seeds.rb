Restaurant.destroy_all
Dish.destroy_all
Tag.destroy_all
DishTag.destroy_all

array_of_names = ["McDonalds", "BK", "wendy's", "outback", "fiveguys", "Ihop", "Denny's", "Pizza Hut", "Papa john's", "cheakers", "lazy moon", "pizza &", "food place 1", "food place 2", "food placce 3", "food place 4", "food plcae 5", "Food place 6", "food palce 7", "food place 8"]

array_of_names.each do |r|
    # binding.pry
   Restaurant.create(name: r)
end

Restaurant.all.each do |restaurant|
    # binding.pry
    10.times do 
        Dish.create(name: Faker::Food.dish, restaurant_id: restaurant.id)
    end
end

array_of_tag = ["Spicy", "vegetarian", "sugar free", "sweet", "gluten free", "raw", "keto", "med spicy", "sour", "bitter"]

array_of_tag.each do |t|
    Tag.create(name: t)
end

#for each dish in the dish table
Dish.all.each do |dish|
    #will grab 3 random tags
    Tag.all.sample(3).each do |tag|
        #for each tag create a dish tag
        DishTag.create(dish_id: dish.id, tag_id: tag.id)
    end
end