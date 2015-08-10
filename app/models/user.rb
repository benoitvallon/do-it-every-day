class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { maximum: 50 }

  after_create :send_welcome_email
  has_many :goals, dependent: :destroy

  private

    def send_welcome_email
      UserMailer.welcome_email(self).deliver_now
    end
end
