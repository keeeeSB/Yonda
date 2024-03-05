class Family < ApplicationRecord
  validates :name, presence: true
  validates :introduction, length: { maximum: 100 }

  has_many :users, dependent: :destroy
end
