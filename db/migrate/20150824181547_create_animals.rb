class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :age
      t.text :description
      t.integer :family
      t.text :contact

      t.timestamps null: false
    end
  end
end
