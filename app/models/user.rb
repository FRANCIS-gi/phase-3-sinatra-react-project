class User < ActiveRecord::Base
    belongs_to :shopping_list
end