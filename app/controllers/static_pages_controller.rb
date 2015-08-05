class StaticPagesController < ApplicationController
  def home
    if current_user
      redirect_to today_path
    end
  end

  def about
  end

  def today
    goals = current_user.goals.all

    @activitiesUnsorted = []
    goals.each do |goal|
      # find daily activity
      activity = goal.activities.find_by(due_date: Time.now.strftime("%Y-%m-%d"))
      if activity
        @activitiesUnsorted << activity
      end
    end

    @activities = @activitiesUnsorted.sort do |a,b|
      a.goal[:moment_start] <=> b.goal[:moment_start]
    end
  end

  def activities
  end
end
