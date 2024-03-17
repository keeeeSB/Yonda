class CreateReadRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :read_records do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :body
      t.date :read_date

      t.timestamps
    end
  end
end
