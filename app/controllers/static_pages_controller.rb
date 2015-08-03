class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def today
    goals = current_user.goals.all

    @activities = []
    goals.each do |goal|
      # find daily activity
      activity = goal.activities.find_by(due_date: Time.now.strftime("%Y-%m-%d"))
      if activity
        @activities << activity
      end
    end
  end

  def activities
  end
end
