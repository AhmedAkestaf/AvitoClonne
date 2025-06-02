require "test_helper"

class AnnoncesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get annonces_index_url
    assert_response :success
  end

  test "should get show" do
    get annonces_show_url
    assert_response :success
  end

  test "should get new" do
    get annonces_new_url
    assert_response :success
  end

  test "should get create" do
    get annonces_create_url
    assert_response :success
  end

  test "should get edit" do
    get annonces_edit_url
    assert_response :success
  end

  test "should get update" do
    get annonces_update_url
    assert_response :success
  end

  test "should get destroy" do
    get annonces_destroy_url
    assert_response :success
  end

  test "should get mes_annonces" do
    get annonces_mes_annonces_url
    assert_response :success
  end

  test "should get recherche" do
    get annonces_recherche_url
    assert_response :success
  end

  test "should get par_categorie" do
    get annonces_par_categorie_url
    assert_response :success
  end
end
