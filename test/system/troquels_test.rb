require "application_system_test_case"

class TroquelsTest < ApplicationSystemTestCase
  setup do
    @troquel = troquels(:one)
  end

  test "visiting the index" do
    visit troquels_url
    assert_selector "h1", text: "Troquels"
  end

  test "should create troquel" do
    visit troquels_url
    click_on "New troquel"

    check "Baja" if @troquel.baja
    fill_in "Categoria", with: @troquel.categoria
    fill_in "Desarrollo", with: @troquel.desarrollo
    fill_in "Imagen", with: @troquel.imagen
    fill_in "Maquina", with: @troquel.maquina
    fill_in "Medida cerrrada", with: @troquel.medida_cerrrada
    fill_in "Numero", with: @troquel.numero
    fill_in "Stock", with: @troquel.stock
    fill_in "Texto", with: @troquel.texto
    click_on "Create Troquel"

    assert_text "Troquel was successfully created"
    click_on "Back"
  end

  test "should update Troquel" do
    visit troquel_url(@troquel)
    click_on "Edit this troquel", match: :first

    check "Baja" if @troquel.baja
    fill_in "Categoria", with: @troquel.categoria
    fill_in "Desarrollo", with: @troquel.desarrollo
    fill_in "Imagen", with: @troquel.imagen
    fill_in "Maquina", with: @troquel.maquina
    fill_in "Medida cerrrada", with: @troquel.medida_cerrrada
    fill_in "Numero", with: @troquel.numero
    fill_in "Stock", with: @troquel.stock
    fill_in "Texto", with: @troquel.texto
    click_on "Update Troquel"

    assert_text "Troquel was successfully updated"
    click_on "Back"
  end

  test "should destroy Troquel" do
    visit troquel_url(@troquel)
    click_on "Destroy this troquel", match: :first

    assert_text "Troquel was successfully destroyed"
  end
end
