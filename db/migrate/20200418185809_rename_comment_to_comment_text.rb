class RenameCommentToCommentText < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :comment, :comment_text
  end
end
