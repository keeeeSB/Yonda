require "test_helper"

class FamilyTest < ActiveSupport::TestCase
  
  def setup
    @family = Family.new(name: "さとう", introduction: "佐藤です。")
  end

  test "名前の必須" do
    @family.name = " "
    assert_not @family.valid?
  end

  test "説明文の文字数の上限" do
    @family.introduction = "a" * 101
    assert_not @family.valid?
  end
end
