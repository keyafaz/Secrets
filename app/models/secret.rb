class Secret < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user

  validates :content, length: { in: 2..30 }
end
