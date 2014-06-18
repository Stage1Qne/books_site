class Comment < ActiveRecord::Base
  searchkick
  default_scope { order("id ASC") }
  scope :not_moderated, -> (){ where moderated: false }
  validates :email, :full_name, presence: true
  validates :content, presence: true, length: { maximum: 2000 }

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing_comment.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



  belongs_to :book
  has_ancestry
end
