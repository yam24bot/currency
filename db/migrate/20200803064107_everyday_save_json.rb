class EverydaySaveJson < ActiveRecord::Migration[6.0]
  def change
    create_table :request do |t|
      t.json 'data'
    end
  end
end
