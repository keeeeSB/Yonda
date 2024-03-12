class CreateChildReadRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :child_read_records do |t|
      t.references :child, null: false, foreign_key: true
      t.references :read_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
