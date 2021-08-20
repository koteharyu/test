class OparationMember::RolesController < ApplicationController
  before_action :set_party

  def update
    current_organizer = @party.party_members&.find_by(role: 1)
    if current_organizer.nil?
      target_members = @party.party_members.all
      selected_member = target_members.sample
      selected_member.update(role: 1)
    else
      target_members = @party.party_members.filter{ |m| m.id != current_organizer.id  }
      selected_member = target_members.sample
      selected_member.update(role: 1)
      current_organizer.update(role: 0)
    end
    redirect_to party_path(@party)
  end

  private

  def set_party
    @party = Party.find(params[:id])
  end
end
