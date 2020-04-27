class HamburguesaIngredientesController < ApplicationController
  before_action :set_hamburguesa_ingrediente, only: [:show, :update, :destroy]

  def agregar_ingredientes
    if Hamburguesa.find_by(id: params[:hamburguesa_id])
      @hamburguesa = Hamburguesa.find(params[:hamburguesa_id])
      if Ingrediente.find_by(id: params[:ingrediente_id])
        @ingrediente = Ingrediente.find(params[:ingrediente_id])
        @ingrediente.path = "burger-api-taller.herokuapp.com/ingrediente/#{@ingrediente.id}"
        esta = @ingrediente.in?(@hamburguesa.ingredientes)
        if esta == TRUE
          render json: "ingrediente ya esta en hamburguesa", status: 201
        else
        @hamburguesa.ingredientes << @ingrediente
        render json: @hamburguesa.as_json(:except => [:created_at, :updated_at], include: { ingredientes: { only: :path } }), status: 201
        end
      else
        render json: "Ingrediente inexistente", status: 404
      end
    else
      render json: "Id de hamburguesa invalido", status: 400
    end
  end

  def eliminar_ingredientes
    if Hamburguesa.find_by(id: params[:hamburguesa_id])
      @hamburguesa = Hamburguesa.find(params[:hamburguesa_id])
      if Ingrediente.find_by(id: params[:ingrediente_id])
        @ingrediente = Ingrediente.find(params[:ingrediente_id])
        @ingrediente.path = "burger-api-taller.herokuapp.com/ingrediente/#{@ingrediente.id}"
        esta = @ingrediente.in?(@hamburguesa.ingredientes)
        if esta == TRUE
          @hamburguesa.ingredientes.delete(@ingrediente)
          render json: "ingrediente retirado", status: 200
        else
        render json:"ingrediente inexistente en la hamburguesa", status: 404
        end
      else
        render json: "Ingrediente inexistente", status: 404
      end
    else
      render json: "Id de hamburguesa invalido", status: 400
    end
  end


  # GET /hamburguesa_ingredientes
  def index
    @hamburguesa_ingredientes = HamburguesaIngrediente.all

    render json: @hamburguesa_ingredientes
  end

  # GET /hamburguesa_ingredientes/1
  def show
    render json: @hamburguesa_ingrediente
  end

  # POST /hamburguesa_ingredientes
  def create
    @hamburguesa_ingrediente = HamburguesaIngrediente.new(hamburguesa_ingrediente_params)

    if @hamburguesa_ingrediente.save
      render json: @hamburguesa_ingrediente, status: :created, location: @hamburguesa_ingrediente
    else
      render json: @hamburguesa_ingrediente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hamburguesa_ingredientes/1
  def update
    if @hamburguesa_ingrediente.update(hamburguesa_ingrediente_params)
      render json: @hamburguesa_ingrediente
    else
      render json: @hamburguesa_ingrediente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hamburguesa_ingredientes/1
  def destroy
    @hamburguesa_ingrediente.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hamburguesa_ingrediente
      @hamburguesa_ingrediente = HamburguesaIngrediente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hamburguesa_ingrediente_params
      params.fetch(:hamburguesa_ingrediente, {})
    end
end
