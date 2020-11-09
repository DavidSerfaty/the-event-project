require 'test_helper'

class CoversControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get covers_create_url
    assert_response :success
  end

end
