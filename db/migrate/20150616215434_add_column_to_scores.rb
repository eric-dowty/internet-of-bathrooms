class AddColumnToScores < ActiveRecord::Migration
  def change
    remove_column :scores, :points
    add_column :scores, :points, :integer, default: 0
  end
end
