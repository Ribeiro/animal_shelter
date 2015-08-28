class Animal < ActiveRecord::Base
	enum family: [ :gato, :cachorro ]
	enum ageunit: [ :mes, :ano ]
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "64x64#" }
	belongs_to :user

	def self.search(query)
	    # where(:title, query) -> This would return an exact match of the query
	    where("description like ?", "%#{query}%") 
  	end

  	def isAdopted?
  		adopted ? 'Sim' : 'Nao'
  	end

end
