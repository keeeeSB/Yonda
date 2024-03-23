class Tag < ApplicationRecord
  has_many :read_record_tags
  has_many :read_records, through: :read_record_tags
  validates :name, presences: true
end
