class Party < ApplicationRecord
  has_many :party_members, dependent: :destroy
  has_many :members, through: :party_members

  validates :name, presence: true
end
