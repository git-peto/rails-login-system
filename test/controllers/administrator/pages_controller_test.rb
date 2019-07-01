require 'test_helper'

class Administrator::PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administrator_pages_index_url
    assert_response :success
  end

end
