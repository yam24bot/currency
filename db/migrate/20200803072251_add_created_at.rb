class AddCreatedAt < ActiveRecord::Migration[6.0]
  def change
    add_column :request, :created_at, :datetime, null: false
  end
end
