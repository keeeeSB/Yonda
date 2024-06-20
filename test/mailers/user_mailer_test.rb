require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "パスワードリセット" do
    mail = UserMailer.password_reset
    assert_equal "パスワードリセット", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
