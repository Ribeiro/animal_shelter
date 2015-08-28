class CreateAdopters < ActiveRecord::Migration
  def change
    create_table :adopters do |t|
      t.string :name
      t.string :rg
      t.string :cpf
      t.text :address
      t.text :phone

      t.timestamps null: false
    end
  end
end
