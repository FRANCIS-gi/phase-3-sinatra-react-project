class Users < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string (:name)
      t.string (:email)
      t.float (:phone_number)
    end
  end
end
