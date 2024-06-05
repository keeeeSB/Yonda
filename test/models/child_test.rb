require "test_helper"

class ChildTest < ActiveSupport::TestCase

  def setup
    @child = Child.new(name: "いちろう", gender: "男の子", birthday: 2022-05-19)
  end

  test "名前の必須" do
    @child.name = " "
    assert_not @child.valid?
  end

  test "性別の必須" do
    @child.gender = " "
    assert_not @child.valid?
  end

  test "誕生日の必須" do
    @child.birthday = nil
    assert_not @child.valid?
  end
end
