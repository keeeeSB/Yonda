require "test_helper"

class UserMailerTest < ActionMailer::TestCase

  def setup
    @user = users(:tarou)
  end

  test "アカウント認証" do
    @user.activation_token = User.new_token
    mail = UserMailer.account_activation(@user)
    assert_equal "アカウント認証", mail.subject
    assert_equal ["tarou@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
  end

  test "パスワードリセット" do
    @user.reset_token = User.new_token
    mail = UserMailer.password_reset(@user)
    assert_equal "パスワードリセット", mail.subject
    assert_equal ["tarou@example.com"], mail.to
    assert_equal ["from@example.com"], mail.from
  end
end
