class Post < ApplicationRecord
  belongs_to :user


  validates :slug, presence: true, uniqueness: true
  validates :title, presence: true, length: { minimum: 4 }
  validates :user_id, presence: true

end
