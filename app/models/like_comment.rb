class LikeComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment
end
