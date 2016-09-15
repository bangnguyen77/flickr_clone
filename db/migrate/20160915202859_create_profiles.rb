class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.column :username, :string
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
