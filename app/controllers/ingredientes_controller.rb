class IngredientesController < ApplicationController
  before_action :set_ingrediente, only: [:show, :update, :destroy]

  # GET /ingredientes
  def index
    @ingredientes = Ingrediente.all
    render json: @ingredientes.as_json(except: ["created_at", "updated_at", "path"]), status: 200
  end

  # GET /ingredientes/1
  def show
      render json: @ingrediente.as_json(except: ["created_at", "updated_at", "path"])
  end

  # POST /ingredientes
  def create
    @ingrediente = Ingrediente.new(ingrediente_params)

    if @ingrediente.save
      render json: @ingrediente.as_json(except: ["path","created_at", "updated_at"]), status: 201, location: @ingrediente
    else
      render json: "Input invalido", status: 400
    end
  end

  # PATCH/PUT /ingredientes/1
  def update
    if @ingrediente.update(ingrediente_params)
      render json: @ingrediente.as_json(except: ["created_at", "updated_at"])
    else
      render json: @ingrediente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ingredientes/1
  def destroy
    esta = 0
    Hamburguesa.all.each do |hambur|
      if @ingrediente.in?(hambur.ingredientes)
        esta = 1
      end
    end
    if esta == 1
      render json: "Ingrediente no se puede borrar, se encuentra presente en una hamburguesa", status: 409
    else
      @ingrediente.destroy
      render json: "Ingrediente eliminado", status: 200

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingrediente
      #@ingrediente = Ingrediente.find(params[:id])
      if (params[:id].to_i != 0)
        if Ingrediente.find_by(id: params[:id])
            @ingrediente = Ingrediente.find(params[:id])
        else
          render json: "ingrediente inexistente", status: 404
        end
      else
        render json: "id invalido", status: 400
      end
    end

    # Only allow a trusted parameter "white list" through.
    def ingrediente_params
      params.require(:ingrediente).permit(:nombre, :descripcion, :path)
    end
end
