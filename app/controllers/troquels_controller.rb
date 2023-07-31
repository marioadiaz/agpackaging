class TroquelsController < ApplicationController
  before_action :set_troquel, only: %i[ show edit update destroy ]

  # GET /troquels or /troquels.json
  def index
    @troquels = Troquel.all.order("updated_at DESC")
  end

  def import
    file = params[:troquel][:file]
    Troquel.import(file)
    redirect_to troquels_path, notice: 'La importación se ha realizado exitosamente.'
  rescue StandardError => e
    redirect_to troquels_path, alert: "Error en la importación: #{e.message}"
  end

  # GET /troquels/1 or /troquels/1.json
  def show
  end

  # GET /troquels/new
  def new
    @troquel = Troquel.new
  end

  # GET /troquels/1/edit
  def edit
  end

  # POST /troquels or /troquels.json
  def create
    @troquel = Troquel.new(troquel_params)
    @troquel.update baja: true

    respond_to do |format|
      if @troquel.save
        format.html { redirect_to troquel_url(@troquel), notice: "Troquel was successfully created." }
        format.json { render :show, status: :created, location: @troquel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @troquel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /troquels/1 or /troquels/1.json
  def update
    respond_to do |format|
      if @troquel.update(troquel_params)
        format.html { redirect_to troquel_url(@troquel), notice: "Troquel was successfully updated." }
        format.json { render :show, status: :ok, location: @troquel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @troquel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /troquels/1 or /troquels/1.json
  def destroy
    @troquel = Troquel.find(params[:id])
    @troquel.update baja: false

    respond_to do |format|
      format.html { redirect_to troquels_url, notice: "Troquel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_troquel
      @troquel = Troquel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def troquel_params
      params.require(:troquel).permit(:categoria, :numero, :desarrollo, :medida_cerrada, :imagen, :texto, :stock, :maquina, :baja)
    end
end
