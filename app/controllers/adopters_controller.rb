class AdoptersController < ApplicationController
  before_action :set_adopter, only: [:show, :edit, :update, :destroy]

  # GET /adopters
  # GET /adopters.json
  def index
    @adopters = Adopter.all
  end

  # GET /adopters/1
  # GET /adopters/1.json
  def show
  end

  # GET /adopters/new
  def new
    @adopter = Adopter.new
  end

  # GET /adopters/1/edit
  def edit
  end

  # POST /adopters
  # POST /adopters.json
  def create
    @adopter = Adopter.new(adopter_params)

    respond_to do |format|
      if @adopter.save
        format.html { redirect_to @adopter, notice: 'Adopter was successfully created.' }
        format.json { render :show, status: :created, location: @adopter }
      else
        format.html { render :new }
        format.json { render json: @adopter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adopters/1
  # PATCH/PUT /adopters/1.json
  def update
    respond_to do |format|
      if @adopter.update(adopter_params)
        format.html { redirect_to @adopter, notice: 'Adopter was successfully updated.' }
        format.json { render :show, status: :ok, location: @adopter }
      else
        format.html { render :edit }
        format.json { render json: @adopter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adopters/1
  # DELETE /adopters/1.json
  def destroy
    @adopter.destroy
    respond_to do |format|
      format.html { redirect_to adopters_url, notice: 'Adopter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adopter
      @adopter = Adopter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adopter_params
      params.require(:adopter).permit(:name, :rg, :cpf, :address, :phone)
    end
end
