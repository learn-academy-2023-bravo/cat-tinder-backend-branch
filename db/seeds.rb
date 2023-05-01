# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

trees = [
  {
    name: 'Maple',
    age: 150,
    enjoys: 'Making syrup',
    image: 'https://cdn.shopify.com/s/files/1/0059/8835/2052/products/Sugar-Maple_FGT_600x600_6ad4956a-ec6e-4ab2-a66a-1a1245471195_grande.jpg?v=1612444329'
  },
  {
    name: 'Oakley',
    age: 160,
    enjoys: 'Wearing Oakley sunglasses',
    image: 'https://static01.nyt.com/images/2021/04/04/realestate/31garden1/oakImage-1617054677967-superJumbo.jpg'
  },
  {
    name: 'Willow',
    age: 158,
    enjoys: 'Feeling wind through branches',
    image: 'https://www.starkbros.com/images/dynamic/5957-560x560-fillv.jpg'
  },
  {
    name: 'Ginger',
    age: 200,
    enjoys: 'Playing basketball',
    image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Sequoiafarm_Sequoiadendron_giganteum.jpg/800px-Sequoiafarm_Sequoiadendron_giganteum.jpg'
  }

]

trees.each do |tree|
  Tree.create tree
  puts "creating tree #{tree}"
end