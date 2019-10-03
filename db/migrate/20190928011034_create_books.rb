class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :b_title
      t.string :b_author
      t.string :b_lang
      t.datetime :b_pub
      t.float :b_edition
      t.text :b_image
      t.string :b_subject
      t.text :b_summary
      t.boolean :b_spl
      t.references :Library, foreign_key: true

      t.timestamps
    end
  end
end
