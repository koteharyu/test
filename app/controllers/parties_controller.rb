class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy, :add_member, :remove_member, :set_organizer]

  # GET /groups
  # GET /groups.json
  def index
    @parties = Party.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    members = Member.all
    @not_participated_members = []
    members.each do |member|
      if
        !member.party_ids.include?(@party.id)
        @not_participated_members << member
      end
    end
  end

  # GET /groups/new
  def new
    @party = Party.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @party = Party.new(party_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'party was successfully created.' }
        format.json { render :show, status: :created, location: @party }
      else
        format.html { render :new }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partys/1
  # PATCH/PUT /partys/1.json

  def update
    if @party.update(party_params)
      redirect_to @party, notice: 'updated'
    else
      render :edit
    end
  end
  # DELETE /partys/1
  # DELETE /partys/1.json
  def destroy
    @party.destroy
    redirect_to parties_path, notice: 'deleted'
  end

  def add_member
    new_member_ids = []
    new_member_ids = @party.member_ids << params[:member_id]
    @party.member_ids = new_member_ids
    redirect_to @party
  end

  def remove_member
    new_member_ids = []
    new_member_ids = @party.member_ids.filter{ |member| member != params[:member_id].to_i }
    @party.member_ids = new_member_ids
    redirect_to @party
  end

  def set_organizer
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
    redirect_to @party
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_params
      params.require(:party).permit(:name)
    end
end
