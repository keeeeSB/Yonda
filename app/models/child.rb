class Child < ApplicationRecord
  belongs_to :family
  has_many :read_records, through: :child_read_records
  has_many :child_read_records

  validates :name, presence: true
  validates :gender, presence: true
  validates :birthday, presence: true
end
