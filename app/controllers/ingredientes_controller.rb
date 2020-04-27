class IngredientesController < ApplicationController
  before_action :set_ingrediente, only: [:show, :update, :destroy]

  # GET /ingredientes
  def index
    @ingredientes = Ingrediente.all
    render json: @ingredientes.as_json(except: ["created_at", "updated_at", "path"])
  end

  # GET /ingredientes/1
  def show
    render json: @ingrediente.as_json(except: ["created_at", "updated_at", "path"])
  end

  # POST /ingredientes
  def create
    @ingrediente = Ingrediente.new(ingrediente_params)

    if @ingrediente.save
      render json: @ingrediente.as_json(except: ["path","created_at", "updated_at"]), status: :created, location: @ingrediente
    else
      render json: @ingrediente.errors, status: :unprocessable_entity
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
    @ingrediente.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingrediente
      @ingrediente = Ingrediente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ingrediente_params
      params.require(:ingrediente).permit(:nombre, :descripcion, :path)
    end
end
