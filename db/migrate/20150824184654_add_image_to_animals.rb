class AddImageToAnimals < ActiveRecord::Migration
  def change
  	add_column :animals, :image_file_name, :image
  end
end
