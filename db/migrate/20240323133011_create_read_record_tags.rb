class CreateReadRecordTags < ActiveRecord::Migration[7.0]
  def change
    create_table :read_record_tags do |t|
      t.references :read_record, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
