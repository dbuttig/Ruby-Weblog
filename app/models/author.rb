class Author < ActiveRecord::Base
  has_many :posts
  has_secure_password
  validates :name, presence: true
  validate_uniqueness_of :name
  delegate :to_s, to: :name
end
