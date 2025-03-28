class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum :role, { normal: 0, manager: 1, admin: 2 }
  enum :status, { inactive: 0, active: 1 }


  validates :full_name, :email, :role, :status, presence: true
  validates :email, uniqueness: true


  def to_s
    full_name
  end
end
