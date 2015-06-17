class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :points
    end
  end
end
