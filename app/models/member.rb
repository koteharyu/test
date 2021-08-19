class Member < ApplicationRecord
  has_many :party_members, dependent: :destroy
  has_many :parties, through: :party_members

  enum role: { regular: 0, organizer: 1}

end
