class RenamePasswordToPasswordDigestInAuthor < ActiveRecord::Migration
  def change
    rename_column :authors, :password, :password_digest
  end
end
