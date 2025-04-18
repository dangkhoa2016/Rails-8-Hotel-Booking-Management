class HotelLocation < ApplicationRecord
  default_scope { order(name: :asc) }
  has_many :rooms


  enum :status, { inactive: 0, active: 1 }


  validates :name, :status, :address, :manager_name, presence: true
  validates :name, uniqueness: true
  validates :address, uniqueness: true


  class << self
    def display_at_show_page_and_form_columns
      [
        {
          name: :name,
          css_class: "col-md-6"
        },
        {
          name: :manager_name,
          css_class: "col-md-6"
        },
        {
          name: :address,
          css_class: "col-12"
        },
        {
          name: :status,
          css_class: "col-12"
        }
      ]
    end
  end


  def to_s
    name
  end
end
