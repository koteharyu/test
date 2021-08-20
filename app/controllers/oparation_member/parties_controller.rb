class OparationMember::PartiesController < ApplicationController
  before_action :set_party

  def update
    new_member_ids = []
    new_member_ids = @party.member_ids << params[:member_id]
    @party.member_ids = new_member_ids
    redirect_to party_path(@party)
  end

  def destroy
    new_member_ids = []
    new_member_ids = @party.member_ids.filter{ |member| member != params[:member_id].to_i }
    @party.member_ids = new_member_ids
    redirect_to party_path(@party)
  end

  private

  def set_party
    @party = Party.find(params[:id])
  end
end
