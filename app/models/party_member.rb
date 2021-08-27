class PartyMember < ApplicationRecord
  belongs_to :party
  belongs_to :member

  validates :role, uniqueness: { scope: [:party_id, :member_id] }
  enum role: { regular: 0, organizer:1 }
end
