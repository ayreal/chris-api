class RemoveListIdFromItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :items, :list_id
  end
end
