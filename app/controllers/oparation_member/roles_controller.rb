class OparationMember::RolesController < ApplicationController
  before_action :set_party

  def update
    if @party.members.blank?
      redirect_to party_path(@party), notice: 'Please add some members'
      return
    end
    current_organizer = @party.party_members&.find_by(role: 1)
    if current_organizer.nil?
      target_members = @party.party_members.all
      selected_member = target_members.sample
      selected_member&.organizer!
    else
      target_members = @party.party_members.filter{ |m| m.id != current_organizer.id  }
      selected_member = target_members.sample
      selected_member&.organizer!
      current_organizer&.regular!
    end
    selected_member = Member.find_by(id: selected_member.member_id)
    redirect_to party_path(@party), notice: "このグループの幹事は#{selected_member.name}さんです"
  end

  private

  def set_party
    @party = Party.find(params[:id])
  end
end
