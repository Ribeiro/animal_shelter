class HomeController < ApplicationController
	skip_before_action :authenticate_user!
	before_action :set_animal, only: [:show]

	def index
    	if params[:search]
      		@animals = Animal.search(params[:search]).order("created_at DESC")
    	else
      		@animals = Animal.where(:adopted => false)
      	end
    end

  	def show
  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end


end
