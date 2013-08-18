class Author < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true
  delegate :to_s, to: :name
end
