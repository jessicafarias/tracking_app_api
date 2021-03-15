class Tasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.float :time
      t.float :goal
      t.float :progress
      t.date :expiration_day
      t.string :img

      t.timestamps
    end
  end
end