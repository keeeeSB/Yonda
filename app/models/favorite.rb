class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :read_record
end
