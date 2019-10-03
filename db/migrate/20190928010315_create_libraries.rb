class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :l_name
      t.string :l_location
      t.integer :l_max_days
      t.string :l_university
      t.float :l_fine

      t.timestamps
    end
  end
end
