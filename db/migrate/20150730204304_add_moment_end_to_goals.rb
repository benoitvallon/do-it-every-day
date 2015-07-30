class AddMomentEndToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :moment_end, :time
  end
end
