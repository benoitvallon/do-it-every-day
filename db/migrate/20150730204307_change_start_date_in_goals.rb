class ChangeStartDateInGoals < ActiveRecord::Migration
  def change
    change_column :goals, :start_date, :date
  end
end
