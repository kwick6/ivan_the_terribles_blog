class Comment < ActiveRecord::Base
  attr_accessible :body, :post
  belongs_to :post
  has_many :replies, dependent: :destroy
  self.per_page = 10
  scope :recent, limit(10).order("created_at ASC")
end
