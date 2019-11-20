class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table :microposts do |t|
      t.integer :topic_id
      t.text :message

      t.timestamps
    end
  end
end
