class AddNotNullToFollowings < ActiveRecord::Migration[6.1]
  def change
    change_column_null :followings, :follower_id, false
    change_column_null :followings, :followed_id, false
  end
end
