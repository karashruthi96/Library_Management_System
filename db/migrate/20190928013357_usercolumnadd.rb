class Usercolumnadd < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :u_name,:string
    add_reference :users, :library, index:true, foreign_key: true
    add_column :users,:l_approved,:boolean
    add_column :users,:s_education ,:string
    add_column :users, :s_max, :integer
  end
end
