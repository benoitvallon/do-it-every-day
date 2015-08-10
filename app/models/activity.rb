class Activity < ActiveRecord::Base
  belongs_to :goal

  validates :progress, numericality: true, allow_nil: true
end
