require "application_system_test_case"

class comentariosTest < ApplicationSystemTestCase
  setup do
    @comentario = comentarios(:one)
  end

  test "visiting the index" do
    visit comentarios_url
    assert_selector "h1", text: "comentarios"
  end

  test "should create comentario" do
    visit comentarios_url
    click_on "New comentario"

    fill_in "Contenido", with: @comentario.contenido
    fill_in "Noticia", with: @comentario.noticia_id
    fill_in "Usuario", with: @comentario.usuario_id
    click_on "Create comentario"

    assert_text "comentario was successfully created"
    click_on "Back"
  end

  test "should update comentario" do
    visit comentario_url(@comentario)
    click_on "Edit this comentario", match: :first

    fill_in "Contenido", with: @comentario.contenido
    fill_in "Noticia", with: @comentario.noticia_id
    fill_in "Usuario", with: @comentario.usuario_id
    click_on "Update comentario"

    assert_text "comentario was successfully updated"
    click_on "Back"
  end

  test "should destroy comentario" do
    visit comentario_url(@comentario)
    click_on "Destroy this comentario", match: :first

    assert_text "comentario was successfully destroyed"
  end
end
