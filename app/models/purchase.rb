class Purchase < ApplicationRecord
  has_many :group_purchases, dependent: :destroy
  has_many :groups, through: :group_purchases

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  validates :name, presence: true
  validates :amount, presence: true
end
