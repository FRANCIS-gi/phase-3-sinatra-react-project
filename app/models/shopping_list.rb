class ShoppingList < ActiveRecord::Base
    self.table_name = "shopping_lists"
  has_many :users
end