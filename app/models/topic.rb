class Topic < ApplicationRecord
  belongs_to :user

  has_many :comments

  validates :name, presence: true, uniqueness: { scope: :user }
end
