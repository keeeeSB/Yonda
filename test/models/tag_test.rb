require "test_helper"

class TagTest < ActiveSupport::TestCase

  def setup
    @tag = Tag.new(name: "ワクワク")
  end

  test "名前の必須" do
    @tag.name = " "
    assert_not @tag.valid?
  end
end
