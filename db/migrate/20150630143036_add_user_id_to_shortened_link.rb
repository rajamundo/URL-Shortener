class AddUserIdToShortenedLink < ActiveRecord::Migration
  def change
    add_column :shortened_links, :user_id, :integer
  end
end
