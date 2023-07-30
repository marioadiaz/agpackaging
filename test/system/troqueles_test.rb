require "application_system_test_case"

class TroquelesTest < ApplicationSystemTestCase
  setup do
    @troquele = troqueles(:one)
  end

  test "visiting the index" do
    visit troqueles_url
    assert_selector "h1", text: "Troqueles"
  end

  test "should create troquele" do
    visit troqueles_url
    click_on "New troquele"

    check "Baja" if @troquele.baja
    fill_in "Categoria", with: @troquele.categoria
    fill_in "Desarrollo", with: @troquele.desarrollo
    fill_in "Imagen", with: @troquele.imagen
    fill_in "Medida cerrrada", with: @troquele.medida_cerrrada
    fill_in "Numero", with: @troquele.numero
    fill_in "Stock", with: @troquele.stock
    fill_in "Texto", with: @troquele.texto
    click_on "Create Troquele"

    assert_text "Troquele was successfully created"
    click_on "Back"
  end

  test "should update Troquele" do
    visit troquele_url(@troquele)
    click_on "Edit this troquele", match: :first

    check "Baja" if @troquele.baja
    fill_in "Categoria", with: @troquele.categoria
    fill_in "Desarrollo", with: @troquele.desarrollo
    fill_in "Imagen", with: @troquele.imagen
    fill_in "Medida cerrrada", with: @troquele.medida_cerrrada
    fill_in "Numero", with: @troquele.numero
    fill_in "Stock", with: @troquele.stock
    fill_in "Texto", with: @troquele.texto
    click_on "Update Troquele"

    assert_text "Troquele was successfully updated"
    click_on "Back"
  end

  test "should destroy Troquele" do
    visit troquele_url(@troquele)
    click_on "Destroy this troquele", match: :first

    assert_text "Troquele was successfully destroyed"
  end
end
