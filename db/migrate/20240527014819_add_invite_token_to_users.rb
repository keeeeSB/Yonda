class AddInviteTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :invite_token, :string
  end
end
