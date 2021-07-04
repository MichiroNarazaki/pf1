class Like < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates :micropost_id, uniqueness: { scope: :user_id }
end
