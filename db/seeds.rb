# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# 10.times do |i|
#     Noticia.create(titulo: Faker::Quotes::Shakespeare.romeo_and_juliet_quote, encabezado: Faker::Quotes::Chiquito.joke, cuerpo: Faker::Lorem.question(word_count: 50) )
# end

# 10.times do |i|
#     User.create(email: Faker::Internet.email(domain: 'gmail.com'), password: "123456")
# end


20.times do |i|
    Comentario.create(contenido: Faker::Fantasy::Tolkien.poem, user_id: Faker::Number.between(from: 1, to: 10), noticia_id:  Faker::Number.between(from: 2, to: 20))
end
