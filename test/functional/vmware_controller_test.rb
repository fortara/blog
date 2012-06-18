require 'test_helper'

class VmwareControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
