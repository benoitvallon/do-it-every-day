class AddGoalIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :goal_id, :integer
    add_index :activities, :goal_id
  end
end
