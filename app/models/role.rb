class Role < ApplicationRecord
  belongs_to :member
  belongs_to :party
end
