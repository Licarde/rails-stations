class CreateScreens < ActiveRecord::Migration[7.1]
  def change
    create_table :screens do |t|
      t.integer :column, :limit => 2, null: false
      t.string :row, :limit => 1, null: false
      t.integer :screen, :limit => 1, null: false
    end
  end
end
