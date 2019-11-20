class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.integer :topic_id
      t.integer :micropost_id
      t.text :reply

      t.timestamps
    end
  end
end
