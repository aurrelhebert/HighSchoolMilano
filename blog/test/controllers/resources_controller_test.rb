require 'test_helper'

class ResourcesControllerTest < ActionController::TestCase
  test "should get tmp" do
    get :tmp
    assert_response :success
  end

end
