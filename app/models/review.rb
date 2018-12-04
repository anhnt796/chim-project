class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :bird
  has_many :replies

  scope :all_comments, ->{order(created_at: :desc)}

  validates :comment, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 50 }
  validates :rating_price, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 50 }
  validates :rating_easy, numericality: { greater_than_or_equal_to: 5, less_than_or_equal_to: 50 }

  def rating_float
    ((rating+rating_price+rating_easy)*0.1/3).round(1)
  end
end
