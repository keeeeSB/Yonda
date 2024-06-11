require "test_helper"

class ContactTest < ActiveSupport::TestCase

  def setup
    @contact = Contact.new(name: "山田太郎", email: "tarou@example.com",
                           body: "お問い合わせです。")
  end

  test "名前の必須" do
    @contact.name = " "
    assert_not @contact.valid?
  end

  test "メールアドレスの必須" do
    @contact.email = " "
    assert_not @contact.valid?
  end

  test "お問い合わせ内容の必須" do
    @contact.body = " "
    assert_not @contact.valid?
  end
end
