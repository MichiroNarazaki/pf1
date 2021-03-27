require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    @my_micropost = Micropost.find_by(user_id: @user.id)
    @other_micropost = Micropost.find_by(user_id: @other_user.id)
  end

  test 'should create like my micropost' do
    log_in_as(@user, remember_me: '1')
    get root_path
    assert_difference 'Like.count', 1 do
      post micropost_likes_path(@my_micropost)
    end
  end

  test "should create like other's micropost" do
    log_in_as(@user, remember_me: '1')
    get root_path
    assert_difference 'Like.count', 1 do
      post micropost_likes_path(@other_micropost)
    end
  end
  test 'should like just only once' do
    log_in_as(@user, remember_me: '1')
    assert_difference 'Like.count', 1 do
      post micropost_likes_path(@my_micropost)
      post micropost_likes_path(@my_micropost)
    end
  end
  test 'should destroy like' do
    log_in_as(@user, remember_me: '1')
    assert_no_difference 'Like.count' do
      post micropost_likes_path(@my_micropost)
      delete micropost_like_path(@my_micropost, id: @user.id)
    end
  end
end
