class Comment < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  validates :topic, presence: true
  validates :user, presence: true
  validates :message, presence: true
end
