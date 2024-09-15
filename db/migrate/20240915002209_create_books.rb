class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :pdf
      t.string :image

      t.timestamps
    end
  end
end
