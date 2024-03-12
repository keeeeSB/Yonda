class Child < ApplicationRecord
  belongs_to :family
  has_many :read_records, through: :child_read_records
end
