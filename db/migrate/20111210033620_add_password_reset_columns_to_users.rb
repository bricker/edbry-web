class AddPasswordResetColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_reset_requested_at, :datetime
    add_column :users, :password_reset_token, :string
  end
end
