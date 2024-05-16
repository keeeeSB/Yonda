class ReadRecord < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :family
  has_many :children, through: :child_read_records
  has_many :child_read_records, dependent: :destroy
  has_many :read_record_tags, dependent: :destroy
  has_many :tags, through: :read_record_tags
  has_many :favorites, dependent: :destroy

  validates :read_date, presence: true

  def save_tags(tags)
    if self.tags.nil?
      self.tags = []
    end
    
    current_tags = self.tags.pluck(:name)
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = tags - current_tags
  
    # 古いタグを消す
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name: old_name)
    end
  
    # 新しいタグを保存
    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name: new_name)
      self.tags << tag
    end
  end

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
