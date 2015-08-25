class Animal < ActiveRecord::Base
	enum family: [ :gato, :cachorro ]
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "64x64#" }
	belongs_to :user
end
