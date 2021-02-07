require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
		@base_title = "YouIdea"
    @user = users(:michael)
  end

  test "should get home" do
    log_in_as(@user, remember_me: '1')
    get root_path
    assert_response :success
	  assert_select "title","#{@base_title}"
  end
end
