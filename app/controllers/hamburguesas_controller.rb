class HamburguesasController < ApplicationController
  before_action :set_hamburguesa, only: [:show, :update, :destroy]

  # GET /hamburguesas
  def index
    @hamburguesas = Hamburguesa.all
    render json: @hamburguesas.as_json(:except => [:created_at, :updated_at], include: { ingredientes: { only: :path } }), status: 200
    #render json: @hamburguesas, :except => [:ingredientes => :nombre]
    #render json: @hamburguesas.as_json(:except => [:created_at, :updated_at, ingredientes: {only: :path}]), status: 200
      # :ingredientes => {:only => :path}
  end

  # GET /hamburguesas/1
  def show
    render json: @hamburguesa.as_json(:except => [:created_at, :updated_at], include: { ingredientes: { only: :path } }), status: 200
  end

  # POST /hamburguesas
  def create
    @hamburguesa = Hamburguesa.new(hamburguesa_params)

    if @hamburguesa.save
      render json: @hamburguesa.as_json(except: ["created_at", "updated_at"]), status: 201, location: @hamburguesa
    else
      render json: @hamburguesa.errors, status: 400
    end
  end

  # PATCH/PUT /hamburguesas/1
  def update
    if @hamburguesa.update(hamburguesa_params)
      render json: @hamburguesa.as_json(except: ["created_at", "updated_at"]), status: 200
    else
      render json: @hamburguesa.errors, status: 400
    end
  end

  # DELETE /hamburguesas/1
  def destroy
    @hamburguesa.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hamburguesa
      @hamburguesa = Hamburguesa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hamburguesa_params
      params.require(:hamburguesa).permit(:nombre, :precio, :descripcion, :imagen, :ingredientes)
    end
end
