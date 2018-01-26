class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :completed, default: false
      t.integer :list_id

      t.timestamps
    end
  end
end
