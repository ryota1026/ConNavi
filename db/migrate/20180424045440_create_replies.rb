class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.integer :user_id
      t.integer :reply_id
      t.string :reply

      t.timestamps
    end
  end
end
