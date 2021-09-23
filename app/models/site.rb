class Site < ApplicationRecord
  has_many :tags
  has_many :posts, through: :tags
end