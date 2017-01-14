class ChangeTypeUserIdForUser < ActiveRecord::Migration[5.0]
  def change
  	change_column :posts, :user_id , 'integer USING CAST(user_id AS integer)'
  end
end
