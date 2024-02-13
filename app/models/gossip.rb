class Gossip < ApplicationRecord
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :like_gossips
  has_many :comments
  belongs_to :user
  
  validates :content, presence: true  
  validates :title, presence: true, length: { minimum: 3, maximum: 14 }
  validates :user, presence: true

end


 