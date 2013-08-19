class Author < ActiveRecord::Base
  has_many :posts
  has_secure_password
  validates :name, presence: true
  delegate :to_s, to: :name
end
