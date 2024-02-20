require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def set_up
    @base_title = "Yonda"
  end
  test "should get top" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end
end
