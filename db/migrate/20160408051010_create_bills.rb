class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.text :description
      t.string :status
      t.string :sponsor

      t.timestamps null: false
    end
  end
end
