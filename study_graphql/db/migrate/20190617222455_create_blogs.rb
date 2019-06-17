class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.string :name, null: false
      t.text :text, null: false

      t.timestamps
    end
  end
end
