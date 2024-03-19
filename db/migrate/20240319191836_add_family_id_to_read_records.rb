class AddFamilyIdToReadRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :read_records, :family, null: false, foreign_key: true
  end
end
