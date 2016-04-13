class ChangeUserIdIntoArticles < ActiveRecord::Migration
  def change
  	rename_column :articles, :user_id, :admin_id
  end
end
