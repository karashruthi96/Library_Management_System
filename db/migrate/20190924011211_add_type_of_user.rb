class AddTypeOfUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_type, :text, default: :student
  end
end
