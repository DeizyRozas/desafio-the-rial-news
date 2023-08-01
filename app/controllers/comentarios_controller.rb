class ComentariosController < ApplicationController
  before_action :set_comentario, only: %i[ show edit update destroy ]
  #load_and_authorize_resource
  


  # GET /comentarios/new
  def new
    @comentario = Comentario.new
  end

  # GET /comentarios/1/edit
  def edit
      @comentario = Comentario.find(params[:id])
    
      if current_user != @comentario.user
        redirect_to root_path
      end
      
  end

  # POST /comentarios or /comentarios.json
  def create
    
    @comentario = Comentario.new(comentario_create_params)
    respond_to do |format|
      if @comentario.save 

        redirect_to noticia_path(@comentario.noticia_id)
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentarios/1 or /comentarios/1.json
  def update
    if current_user != @comentario.user
      redirect_to root_path, notice: "No tienes permisos para editar este comentario"
    else
      if @comentario.update(comentario_update_params)
        redirect_to @comentario.noticia, notice: 'Comentario actualizado exitosamente.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /comentarios/1 or /comentarios/1.json
  def destroy 
    noticia_id = @comentario.noticia_id # Obtén el noticia_id del comentario 
    @comentario.destroy
    respond_to do |format| 
      format.html { redirect_to noticium_path(noticia_id)} 
      format.json { head :no_content } 
    end 
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comentario_create_params
      params.require(:comentario).permit(:contenido).merge(noticia_id: params[:noticia_id], user_id: params[:user_id])
      

    end
    
  
    # Define los parámetros permitidos para actualizar un comentario
    def comentario_update_params
      params.require(:comentario).permit(:contenido)
    end

end
