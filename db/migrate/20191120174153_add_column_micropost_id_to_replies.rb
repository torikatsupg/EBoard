class AddColumnMicropostIdToReplies < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :micopost_id, :integer
  end
end
