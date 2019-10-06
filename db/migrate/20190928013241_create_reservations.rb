class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :User, foreign_key: true
      t.references :Book, foreign_key: true
      t.datetime :t_borrow
      t.datetime :d_return
      t.string :status
      t.boolean :bookmark
      t.float :fine_total

      t.timestamps
    end
  end
end
