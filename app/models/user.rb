class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :stat
  after_create :init_stat

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end


  def init_stat
    self.build_stat.save(validate: false)
  end
end
