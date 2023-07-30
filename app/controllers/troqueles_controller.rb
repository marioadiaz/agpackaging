class TroquelesController < ApplicationController
  before_action :set_troquele, only: %i[ show edit update destroy ]

  # GET /troqueles or /troqueles.json
  def index
    @troqueles = Troquele.all
  end

  # GET /troqueles/1 or /troqueles/1.json
  def show
  end

  # GET /troqueles/new
  def new
    @troquele = Troquele.new
  end

  # GET /troqueles/1/edit
  def edit
  end

  # POST /troqueles or /troqueles.json
  def create
    @troquele = Troquele.new(troquele_params)
    @troquele.update baja: true

    respond_to do |format|
      if @troquele.save
        format.html { redirect_to troquele_url(@troquele), notice: "Troquele was successfully created." }
        format.json { render :show, status: :created, location: @troquele }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @troquele.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /troqueles/1 or /troqueles/1.json
  def update
    respond_to do |format|
      if @troquele.update(troquele_params)
        format.html { redirect_to troquele_url(@troquele), notice: "Troquele was successfully updated." }
        format.json { render :show, status: :ok, location: @troquele }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @troquele.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /troqueles/1 or /troqueles/1.json
  def destroy
    @troquele.destroy

    respond_to do |format|
      format.html { redirect_to troqueles_url, notice: "Troquele was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_troquele
      @troquele = Troquele.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def troquele_params
      params.require(:troquele).permit(:categoria, :numero, :desarrollo, :medida_cerrrada, :imagen, :texto, :stock, :baja, :maquina)
    end
end
