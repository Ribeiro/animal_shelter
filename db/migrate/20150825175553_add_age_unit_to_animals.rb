class AddAgeUnitToAnimals < ActiveRecord::Migration
  def up
  	add_column :animals, :ageunit, :integer
  end
end
