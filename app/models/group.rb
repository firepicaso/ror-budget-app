class Group < ApplicationRecord
  has_many :group_purchases, dependent: :destroy
  has_many :purchases, through: :group_purchases

  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
end
