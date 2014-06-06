class Book < ActiveRecord::Base
  belongs_to :author

  validates :name, :series, :publisher, :binding, :format, :isbn, presence: true
  validates :year, :pages, :weight, :author_id, numericality: { only_integer: true }
  validates :decription, presence: true, length: { maximum: 1000 }
end
