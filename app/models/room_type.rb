class RoomType < ApplicationRecord
  has_many :rooms


  enum :status, { inactive: 0, active: 1 }


  validates :name, :status, :summary, presence: true
  validates :name, uniqueness: true


  def to_s
    name
  end

  def display_at_index_page_columns
    %w[name summary color status]
  end
end
