class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  has_many :users
  # Create a shopping list
  post "/shopping_lists" do
    shopping_list = ShoppingList.create(title: params[:title])
    shopping_list.to_json
  end

  # Read the first item in the table
  get "/shopping_lists/first" do
    first_item = ShoppingList.first
    first_item.to_json
  end

  # Read the last item in the table
  get "/shopping_lists/last" do
    last_item = ShoppingList.last
    last_item.to_json
  end

  # Read the quantity of an item based on its id
  get "/shopping_lists/:id/quantity" do
    item = ShoppingList.find(params[:id])
    { quantity: item.quantity }.to_json
  end

  # Read the price of an item based on its id
  get "/shopping_lists/:id/price" do
    item = ShoppingList.find(params[:id])
    { price: item.price }.to_json
  end

  # Read an item based on its attributes
  get "/shopping_lists/find_by" do
    item = ShoppingList.find_by(params[:attributes])
    item.to_json
  end

  # Update a single item
  patch "/shopping_lists/:id" do
    item = ShoppingList.find(params[:id])
    item.update(params[:attributes])
    item.to_json
  end

  # Update the name of all items at once
  patch "/shopping_lists/update_all" do
    ShoppingList.update_all(name: params[:name])
    { message: "All items updated." }.to_json
  end

  # Delete a single item
  delete "/shopping_lists/:id" do
    item = ShoppingList.find(params[:id])
    item.destroy
    { message: "Item deleted." }.to_json
  end

  # Delete all items at once
  delete "/shopping_lists/delete_all" do
    ShoppingList.destroy_all
    { message: "All items deleted." }.to_json
  end
end
