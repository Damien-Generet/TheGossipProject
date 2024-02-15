class User < ApplicationRecord
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :like_gossips
  has_many :like_comments
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  validates_uniqueness_of :email
end
