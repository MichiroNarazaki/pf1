require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "layout links" do
  log_in_as(@user, remember_me: '1')
  get root_path
  assert_template 'static_pages/home'
  assert_select "a[href=?]", create_micropost_path, count: 1#headerに1つ
  assert_select "a[href=?]", search_path, count: 1#headerに1つ,footerに1つ(1番左) //rankingができたらコメントアウト外す
  assert_select "a[href=?]", ranking_path, count: 1#footerに1つ(左から2番目)
  assert_select "a[href=?]", create_micropost_path, count:1
  assert_select "a[href=?]", root_path, count:2
  assert_select "footer a[href=?]", user_path(@user), count:1
  end
end
