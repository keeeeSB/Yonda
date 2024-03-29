class Tag < ApplicationRecord
  has_many :read_record_tags, dependent: :destroy 
  has_many :read_records, through: :read_record_tags
  
  validates :name, presence: true, uniqueness: true
end
