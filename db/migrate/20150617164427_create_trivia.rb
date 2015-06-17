class CreateTrivia < ActiveRecord::Migration
  def change
    create_table :trivia do |t|
      t.string :answer
      t.integer :value
      t.references :user, index: true, foreign_key: true
    end
  end
end
