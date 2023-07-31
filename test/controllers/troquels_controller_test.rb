require "test_helper"

class TroquelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @troquel = troquels(:one)
  end

  test "should get index" do
    get troquels_url
    assert_response :success
  end

  test "should get new" do
    get new_troquel_url
    assert_response :success
  end

  test "should create troquel" do
    assert_difference("Troquel.count") do
      post troquels_url, params: { troquel: { baja: @troquel.baja, categoria: @troquel.categoria, desarrollo: @troquel.desarrollo, imagen: @troquel.imagen, maquina: @troquel.maquina, medida_cerrrada: @troquel.medida_cerrrada, numero: @troquel.numero, stock: @troquel.stock, texto: @troquel.texto } }
    end

    assert_redirected_to troquel_url(Troquel.last)
  end

  test "should show troquel" do
    get troquel_url(@troquel)
    assert_response :success
  end

  test "should get edit" do
    get edit_troquel_url(@troquel)
    assert_response :success
  end

  test "should update troquel" do
    patch troquel_url(@troquel), params: { troquel: { baja: @troquel.baja, categoria: @troquel.categoria, desarrollo: @troquel.desarrollo, imagen: @troquel.imagen, maquina: @troquel.maquina, medida_cerrrada: @troquel.medida_cerrrada, numero: @troquel.numero, stock: @troquel.stock, texto: @troquel.texto } }
    assert_redirected_to troquel_url(@troquel)
  end

  test "should destroy troquel" do
    assert_difference("Troquel.count", -1) do
      delete troquel_url(@troquel)
    end

    assert_redirected_to troquels_url
  end
end
