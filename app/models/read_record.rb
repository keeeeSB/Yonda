class ReadRecord < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :children, through: :child_read_records
  has_many :child_read_records
end
