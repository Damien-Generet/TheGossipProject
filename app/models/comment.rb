class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :user
  has_many :like_comments
  validates :content, presence: true, length: { minimum: 3, maximum: 100 }
end