class AddDurationToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :duration, :integer
  end
end
