class Comment < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  validates :comments, presence: true
end
