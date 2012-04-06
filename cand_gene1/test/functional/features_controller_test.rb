require 'test_helper'

class FeaturesControllerTest < ActionController::TestCase
  setup do
    @feature = features(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feature" do
    assert_difference('Feature.count') do
      post :create, feature: { comment: @feature.comment, gene_id: @feature.gene_id, pubmed: @feature.pubmed, rating: @feature.rating, topic_id: @feature.topic_id, url: @feature.url }
    end

    assert_redirected_to feature_path(assigns(:feature))
  end

  test "should show feature" do
    get :show, id: @feature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feature
    assert_response :success
  end

  test "should update feature" do
    put :update, id: @feature, feature: { comment: @feature.comment, gene_id: @feature.gene_id, pubmed: @feature.pubmed, rating: @feature.rating, topic_id: @feature.topic_id, url: @feature.url }
    assert_redirected_to feature_path(assigns(:feature))
  end

  test "should destroy feature" do
    assert_difference('Feature.count', -1) do
      delete :destroy, id: @feature
    end

    assert_redirected_to features_path
  end
end
