class Book < ActiveRecord::Base
  validates :name, :series, :publisher, :binding, :format, :isbn, presence: true
  validates :year, :pages, :weight, :author_id, numericality: { only_integer: true }
  validates :decription, presence: true, length: { maximum: 1000 }

  belongs_to :author
  has_many :comments

  paginates_per 9
end
