class ChildReadRecord < ApplicationRecord
  belongs_to :child
  belongs_to :read_record
end
