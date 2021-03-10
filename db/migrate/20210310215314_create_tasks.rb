class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.float :time
      t.float :goal
      t.date :expiration_day

      t.timestamps
    end
  end
end
