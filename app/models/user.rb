class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  attr_accessor :invite_token
  before_save   :downcase_email
  before_create :create_activation_digest
  before_create :activate_user_if_invited
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  belongs_to :family, optional: true
  has_many :read_records, dependent: :destroy
  has_many :books
  has_many :favorites, dependent: :destroy

  # 渡された文字列のハッシュ値を返す
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムなトークンを返す
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # 永続的セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # ユーザーのログイン情報を破棄する
  def forget
    update_attribute(:remember_digest, nil)
  end

  # パスワード再設定の属性を設定する
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # パスワード再設定のメールを送信する
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # パスワード再設定の有効期限が切れている場合はtrueを返す
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # 有効化用のメールを送信する
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
    update_attribute(:activation_sent_at, Time.zone.now)
  end

  # アカウントを有効にする
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # 有効化リンクの有効期限（24時間）が切れている場合はtrueを返す
  def activation_expired?
    activation_sent_at < 24.hours.ago
  end

  private

  # メールアドレスを全て小文字にする
  def downcase_email
    self.email = email.downcase
  end

  # 有効化トークンとダイジェストを作成及び代入する
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

  def activate_user_if_invited
    if invite_token.present?
      self.activated = true
      self.activated_at = Time.current
    end
  end
end
