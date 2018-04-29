class RenameReplyIdToReply < ActiveRecord::Migration[5.1]
  def change
    rename_column :replies, :reply_id, :post_id
  end
end
