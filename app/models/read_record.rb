class ReadRecord < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :family
  has_many :children, through: :child_read_records
  has_many :child_read_records
  has_many :read_record_tags, dependent: :destroy
  has_many :tags, through: :read_record_tags

  validates :read_date, presence: true
end
