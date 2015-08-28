class AdoptionsController < ApplicationController
  before_action :set_adoption, only: [:show, :edit, :update, :destroy]
  before_action :set_animal, only: [:edit, :update, :new]
  
  # GET /adoptions
  # GET /adoptions.json
  def index
    @adoptions = Adoption.all
  end

  # GET /adoptions/1
  # GET /adoptions/1.json
  def show
  end

  # GET /adoptions/new
  def new
    @adoption = Adoption.new
    @adoption.animal = @animal
    @adoption.adopter = Adopter.new
  end

  # GET /adoptions/1/edit
  def edit
  end

  # POST /adoptions
  # POST /adoptions.json
  def create
    @adoption = Adoption.new(adoption_params)
    
    respond_to do |format|
      if @adoption.save

         @animal = Animal.find(adoption_params[:animal_id])
         @animal.adopted = true
         @animal.save

        format.html { redirect_to animals_url, notice: 'Adoçao realizada com sucesso!' }
        format.json { render :show, status: :created, location: @adoption }
      else
        format.html { render :new }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adoptions/1
  # PATCH/PUT /adoptions/1.json
  def update
    respond_to do |format|
      if @adoption.update(adoption_params)
        format.html { redirect_to adoptions_url, notice: 'Adoçao atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @adoption }
      else
        format.html { render :edit }
        format.json { render json: @adoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adoptions/1
  # DELETE /adoptions/1.json
  def destroy
    @adoption = Adoption.find(params[:id])
    @animal = Animal.find(@adoption.animal_id)

    @adoption.destroy

    @animal.adopted = false
    @animal.save

    respond_to do |format|
      format.html { redirect_to animals_url, notice: 'Adoçao desfeita com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption
      @adoption = Adoption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adoption_params
      params.require(:adoption).permit(:adopter_id, :animal_id)
    end

    def set_animal
      @animal = Animal.find(params[:animal_id])
    end  

end
