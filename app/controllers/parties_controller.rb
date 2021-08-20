class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]

  def index
    @parties = Party.all
  end

  def show
    members = Member.all
    @not_participated_members = []
    members.each do |member|
      if !member.party_ids.include?(@party.id)
        @not_participated_members << member
      end
    end
  end

  def new
    @party = Party.new
  end

  def edit
  end

  def create
    @party = Party.new(party_params)
    if @party.save
      redirect_to @party, notice: 'party was successfully created.'
    else
      render :new
    end
  end

  def update
    if @party.update(party_params)
      redirect_to @party, notice: 'updated'
    else
      render :edit
    end
  end

  def destroy
    @party.destroy
    redirect_to parties_path, notice: 'deleted'
  end

  private

    def set_party
      @party = Party.find(params[:id])
    end

    def party_params
      params.require(:party).permit(:name)
    end
end
