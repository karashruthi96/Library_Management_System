class AddAvailabilityOfBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :available, :boolean
  end
end
