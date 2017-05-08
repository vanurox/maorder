class AddResetFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users,:expired,:boolean,:default=>0
  	add_column :users,:password_reset_token,:string
  	add_column :users,:password_reset_token_sent_at,:datetime
  end
end
