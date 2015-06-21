class CreateBathrooms < ActiveRecord::Migration
  def change
    create_table :bathrooms do |t|
      t.string :description
      t.integer :status, default: 0
    end
  end
end
