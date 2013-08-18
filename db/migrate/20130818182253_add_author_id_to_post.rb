class AddAuthorIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :author_id, :integer
    remove_column :posts, :author

    add_index :posts, :author_id
  end
end
