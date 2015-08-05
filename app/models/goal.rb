class Goal < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :moment_start, presence: true
  validates :moment_end, presence: true

  has_many :activities, dependent: :destroy
end
