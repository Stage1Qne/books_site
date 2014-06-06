class Author < ActiveRecord::Base
  validates :full_name, presence: true
  has_many :books
end
