require 'rails_helper'

RSpec.describe "Trees", type: :request do
  describe "GET /index" do

    it "should get a list of trees" do
      Tree.create(
        name: 'Maple',
        age: 150,
        enjoys: 'Making syrup',
        image: 'https://cdn.shopify.com/s/files/1/0059/8835/2052/products/Sugar-Maple_FGT_600x600_6ad4956a-ec6e-4ab2-a66a-1a1245471195_grande.jpg?v=1612444329'
      )

      get '/trees'

      trees = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(trees.length).to eq 1
    end
  end

  describe "POST /create" do
    it "should create a new tree" do
      tree_params = {
        tree: {
          name: 'Maple',
          age: 150,
          enjoys: 'Making syrup',
          image: 'https://cdn.shopify.com/s/files/1/0059/8835/2052/products/Sugar-Maple_FGT_600x600_6ad4956a-ec6e-4ab2-a66a-1a1245471195_grande.jpg?v=1612444329'
        }
      }

      post '/trees', params: tree_params

      expect(response).to have_http_status(200)

      tree = Tree.first

      expect(tree.name).to eq 'Maple'
    end
  end

  describe "PUT /update" do
    it "should update an existing tree" do
      tree = Tree.create(
          name: 'Maple',
          age: 150,
          enjoys: 'Making syrup',
          image: 'https://cdn.shopify.com/s/files/1/0059/8835/2052/products/Sugar-Maple_FGT_600x600_6ad4956a-ec6e-4ab2-a66a-1a1245471195_grande.jpg?v=1612444329'
      )

      update_params = {
        tree: {
          name: 'Ginger',
          age: 200,
          enjoys: 'Playing basketball',
          image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Sequoiafarm_Sequoiadendron_giganteum.jpg/800px-Sequoiafarm_Sequoiadendron_giganteum.jpg'
        }
      }

      put "/trees/#{tree.id}", params: update_params

      expect(response).to have_http_status(200)

      tree = Tree.first

      expect(tree.name).to eq 'Ginger'

    end
  end

  describe "DELETE /destroy" do
    it "should delete an existing tree" do
      tree = Tree.create(
          name: 'Maple',
          age: 150,
          enjoys: 'Making syrup',
          image: 'https://cdn.shopify.com/s/files/1/0059/8835/2052/products/Sugar-Maple_FGT_600x600_6ad4956a-ec6e-4ab2-a66a-1a1245471195_grande.jpg?v=1612444329'
      )

      delete "/trees/#{tree.id}"

      expect(response).to have_http_status(200)
      # expect(response.body).to be_nil

    end
  end
end
