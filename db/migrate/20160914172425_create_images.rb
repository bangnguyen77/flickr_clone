class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.column :title, :string
      t.column :url, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
