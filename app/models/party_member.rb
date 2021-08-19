class PartyMember < ApplicationRecord
  belongs_to :party
  belongs_to :member

  enum role: { regular: 0, organizer: 1}
end
