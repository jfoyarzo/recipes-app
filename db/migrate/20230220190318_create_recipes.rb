class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :preparation
      t.time :time
      t.string :cooking
      t.time :time
      t.text :description
      t.boolean :public

      t.timestamps
    end
  end
end
