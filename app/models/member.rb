class Member < ApplicationRecord
  has_many :party_members, dependent: :destroy
  has_many :parties, through: :party_members
  has_many :role, through: :party_members

  validates :name, presence: true
end
