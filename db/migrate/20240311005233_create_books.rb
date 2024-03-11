class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :published_date
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
