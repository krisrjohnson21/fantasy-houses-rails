class House < ApplicationRecord
  has_many :members

  validates :name, presence: true
  validates :source, presence: true
  validates :author, presence: true
end
