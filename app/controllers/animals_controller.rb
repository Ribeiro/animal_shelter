class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update, :destroy, :adopt]

  # GET /animals
  # GET /animals.json

  #def index
    #@animals = Animal.all.where(:user_id => current_user.id)
  #end

  def index
      if params[:search]
          @animals = Animal.search(params[:search]).where(:user_id => current_user.id).order("created_at DESC")
      else
          @animals = Animal.all.where(:user_id => current_user.id)
      end
  end

  def adopt
    @adopter = Adopter.new
  end 

  # GET /animals/1
  # GET /animals/1.json
  def show
  end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user

    respond_to do |format|
      if @animal.save
        format.html { redirect_to animals_url, notice: "Animal salvo com sucesso!" }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to animals_url, notice: "Animal atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: "Animal excluido com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = params[:id] ? Animal.find(params[:id]) : Animal.find(params[:animal_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:name, :age, :description, :family, :contact, :adopted, :image, :ageunit)
    end
end
