class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.datetime :last_logged_in
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
