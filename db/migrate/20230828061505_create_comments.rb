class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commentor
      t.string :comment
      t.string :image
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
