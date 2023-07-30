require "test_helper"

class TroquelesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @troquele = troqueles(:one)
  end

  test "should get index" do
    get troqueles_url
    assert_response :success
  end

  test "should get new" do
    get new_troquele_url
    assert_response :success
  end

  test "should create troquele" do
    assert_difference("Troquele.count") do
      post troqueles_url, params: { troquele: { baja: @troquele.baja, categoria: @troquele.categoria, desarrollo: @troquele.desarrollo, imagen: @troquele.imagen, medida_cerrrada: @troquele.medida_cerrrada, numero: @troquele.numero, stock: @troquele.stock, texto: @troquele.texto } }
    end

    assert_redirected_to troquele_url(Troquele.last)
  end

  test "should show troquele" do
    get troquele_url(@troquele)
    assert_response :success
  end

  test "should get edit" do
    get edit_troquele_url(@troquele)
    assert_response :success
  end

  test "should update troquele" do
    patch troquele_url(@troquele), params: { troquele: { baja: @troquele.baja, categoria: @troquele.categoria, desarrollo: @troquele.desarrollo, imagen: @troquele.imagen, medida_cerrrada: @troquele.medida_cerrrada, numero: @troquele.numero, stock: @troquele.stock, texto: @troquele.texto } }
    assert_redirected_to troquele_url(@troquele)
  end

  test "should destroy troquele" do
    assert_difference("Troquele.count", -1) do
      delete troquele_url(@troquele)
    end

    assert_redirected_to troqueles_url
  end
end
