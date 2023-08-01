class NoticiaController < ApplicationController
  before_action :authenticate_user!
  # GET /noticia or /noticia.json
  def index
    
    @noticias = Noticia.all
  end

  # GET /noticia/1 or /noticia/1.json
  def show
    
    @noticia = Noticia.find(params[:id])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticia
      @noticia = Noticia.find(params[:id])
    end
end
