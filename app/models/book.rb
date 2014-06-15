class Book < ActiveRecord::Base
  validates :name, :series, :publisher, :binding, :format, :isbn, presence: true
  validates :year, :pages, :weight, :author_id, numericality: { only_integer: true }
  validates :decription, presence: true, length: { maximum: 1000 }

  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "missing_book.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  belongs_to :author
  has_many :comments

  paginates_per 9
end
