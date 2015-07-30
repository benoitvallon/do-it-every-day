class AddMomentStartToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :moment_start, :time
  end
end
