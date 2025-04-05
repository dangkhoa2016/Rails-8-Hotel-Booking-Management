class RoomType < ApplicationRecord
  has_many :rooms


  enum :status, { inactive: 0, active: 1 }


  validates :name, :status, :summary, presence: true
  validates :name, uniqueness: true


  class << self
    def display_at_index_page_columns
      %w[name summary color status]
    end

    def display_at_show_page_and_form_columns
      [
        {
          name: :name,
          css_class: "col-md-8"
        },
        {
          name: :color,
          css_class: "col-md-4"
        },
        {
          name: :summary,
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
