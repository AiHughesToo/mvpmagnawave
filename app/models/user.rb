class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :stat
  has_many :nomination
  
  after_create :init_stat

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def my_nominations
   my_noms = Nomination.where(user_id: :id)
  end


  def init_stat
    self.build_stat.save(validate: false)
  end
end
