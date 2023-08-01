class CreateComentarios < ActiveRecord::Migration[7.0]
  def change
    create_table :comentarios do |t|
      t.string :contenido
      t.integer :noticia_id
      t.integer :user_id

      t.timestamps
    end
  end
end
