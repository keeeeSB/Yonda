class AddInvitationToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :invite_digest, :string
  end
end
