class HomeController < ApplicationController
	skip_before_action :authenticate_user!
	before_action :set_animal, only: [:show]

	def index
    	@animals = Animal.where(:adopted => false)
  	end

  	def show
  	end

  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end


end
