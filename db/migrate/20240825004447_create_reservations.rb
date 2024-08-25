class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :date, null: false
      t.references :schedule, foreign_key: true
      t.references :sheet, foreign_key:true
      t.string :email, null: false, :limit => 255
      t.string :name, null: false, :limit => 50
      
      t.timestamps
      t.index [:schedule_id, :sheet_id], unique: true
    end

    
  end
end
