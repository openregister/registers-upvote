class AddUserToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :email, :string
    add_column :votes, :interest, :string
  end
end
