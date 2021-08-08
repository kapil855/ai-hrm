class User < ApplicationRecord

  validates :first_name, :last_name, :email, presence:true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_many :daily_attendances, dependent: :destroy

  before_create :default_role

  def full_name
    "#{first_name} #{last_name}"
  end
  paginates_per 5
  # Instance methods
  def admin?
    self.role == 'admin'
  end

  def default_role
    self.role = 'visitior' if self.role.nil?
  end
end
