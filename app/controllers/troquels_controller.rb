class TroquelsController < ApplicationController
  before_action :set_troquel, only: %i[ show edit update destroy ]

  # GET /troquels or /troquels.json
  def index
    @troquels = Troquel.all.order("updated_at DESC")
  end

  def import
    if params[:file].present?
      spreadsheet = open_spreadsheet(params[:file])
      header = spreadsheet.row(1)

      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        troquel = Troquel.new(row)
        troquel.update baja: true

        troquel.save
      end

      redirect_to troquels_path, notice: 'Archivo importado exitosamente.'
    else
      redirect_to troquels_path, alert: 'No se seleccionó ningún archivo.'
    end
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
    def open_spreadsheet(file)
      case File.extname(file.original_filename)
      when '.csv' then Roo::CSV.new(file.path)
      when '.xls' then Roo::Excel.new(file.path)
      when '.xlsx' then Roo::Excelx.new(file.path)
      else raise "Tipo de archivo desconocido: #{file.original_filename}"
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_troquel
      @troquel = Troquel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def troquel_params
      params.require(:troquel).permit(:categoria, :numero, :desarrollo, :medida_cerrada, :imagen, :texto, :stock, :maquina, :baja)
    end
end
