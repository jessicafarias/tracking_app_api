class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.float :time
      t.float :goal
      t.float :progress
      t.date :day
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
