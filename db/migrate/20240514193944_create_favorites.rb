class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :read_record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
