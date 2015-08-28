class CreateAdoptions < ActiveRecord::Migration
  def change
    create_table :adoptions do |t|
      t.references :adopter, index: true, foreign_key: true
      t.references :animal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
