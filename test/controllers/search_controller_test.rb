require "test_helper"

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get searchResults" do
    get search_searchResults_url
    assert_response :success
  end

  test "should get cocktailPage" do
    get search_cocktailPage_url
    assert_response :success
  end
end
