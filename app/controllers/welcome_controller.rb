class WelcomeController < ApplicationController
  def index
    @noticias = Noticia.order(created_at: :desc)
  end
end
