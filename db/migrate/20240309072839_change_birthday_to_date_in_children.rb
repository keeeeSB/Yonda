class ChangeBirthdayToDateInChildren < ActiveRecord::Migration[7.0]
  def change
    change_column :children, :birthday, :date
  end
end
