class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Shopping Lists

  post "/shopping_lists" do
    shopping_list = ShoppingList.create(name: params[:name], quantity: params[:quantity], price: params[:price])
    shopping_list.to_json
  end

  get "/shopping_lists/first" do
    first_item = ShoppingList.first
    first_item.to_json
  end

  get "/shopping_lists/last" do
    last_item = ShoppingList.last
    last_item.to_json
  end

  get "/shopping_lists/:id/quantity" do
    item = ShoppingList.find(params[:id])
    { quantity: item.quantity }.to_json
  end

  get "/shopping_lists/:id/price" do
    item = ShoppingList.find(params[:id])
    { price: item.price }.to_json
  end

  get "/shopping_lists/find_by" do
    item = ShoppingList.find_by(params[:attributes])
    item.to_json
  end

  patch "/shopping_lists/:id" do
    item = ShoppingList.find(params[:id])
    item.update(name: params[:name], quantity: params[:quantity], price: params[:price])
    item.to_json
  end

  patch "/shopping_lists/update_all" do
    ShoppingList.update_all(name: params[:name], quantity: params[:quantity], price: params[:price])
    { message: "All items updated." }.to_json
  end

  delete "/shopping_lists/:id" do
    item = ShoppingList.find(params[:id])
    item.destroy
    { message: "Item deleted." }.to_json
  end

  delete "/shopping_lists/delete_all" do
    ShoppingList.destroy_all
    { message: "All items deleted." }.to_json
  end

  # Users

  post "/users" do
    user = User.create(name: params[:name], email: params[:email], phone_number: params[:phone_number])
    user.to_json
  end

  get "/users" do
    users = User.all
    users.to_json
  end

  get "/users/:id" do
    user = User.find(params[:id])
    user.to_json
  end

  patch "/users/:id" do
    user = User.find(params[:id])
    user.update(name: params[:name], email: params[:email], phone_number: params[:phone_number])
    user.to_json
  end

  delete "/users/:id" do
    user = User.find(params[:id])
    user.destroy
    { message: "User deleted." }.to_json
  end
end
