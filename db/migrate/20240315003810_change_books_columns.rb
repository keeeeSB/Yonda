class ChangeBooksColumns < ActiveRecord::Migration[7.0]
  def change
    change_table :books do |t|
      t.rename :isbn, :systemid
      t.rename :thumbnail_url, :image_link
    end
  end
end
