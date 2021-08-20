class Member < ApplicationRecord
  has_many :party_members, dependent: :destroy
  has_many :parties, through: :party_members
  has_many :role, through: :role

  validates :name, presence: true
end
