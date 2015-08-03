class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.date :due_date
      t.boolean :done
      t.float :progress
      t.text :note

      t.timestamps null: false
    end
  end
end
