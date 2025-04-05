class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  enum :role, { normal: 0, manager: 1, admin: 2 }
  enum :status, { inactive: 0, active: 1 }


  validates :full_name, :email, :role, :status, presence: true
  # validates :email, uniqueness: true


  class << self
    def display_at_index_page_columns
      %w[full_name email role status]
    end

    def display_at_show_page_and_form_columns
      [
        {
          name: :full_name,
          css_class: "col-md-6"
        },
        {
          name: :email,
          css_class: "col-md-6"
        },
        {
          name: :role,
          css_class: "col-md-6"
        },
        {
          name: :status,
          css_class: "col-12"
        }
      ]
    end
  end


  def to_s
    full_name
  end
end
