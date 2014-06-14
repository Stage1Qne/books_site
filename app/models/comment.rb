class Comment < ActiveRecord::Base
  default_scope { order("id ASC") }
  validates :email, :full_name, presence: true
  validates :content, presence: true, length: { maximum: 2000 }

  belongs_to :book
  has_ancestry
end
