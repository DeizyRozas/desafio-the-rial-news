json.extract! comentario, :id, :contenido, :noticia_id, :usuario_id, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
