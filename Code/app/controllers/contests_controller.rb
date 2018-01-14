class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]

  # GET /contests
  # GET /contests.json
  def index
    @contests = Contest.where('id!=?', 1).order(startDateTime: :desc)
  end

  # GET /contests/1
  # GET /contests/1.json
  def show
    @problem_in_contest = ProblemInContest.new
    @problems = Problem.joins(:problem_in_contests).where('contest_id= ?',params[:id])
    @participants = Participant.where('contest_id=?',params[:id])
    @parorder=Submission.joins('INNER JOIN participants on submissions.user_id=participants.user_id AND submissions.contest_id=participants.contest_id  ').select("submissions.user_id, COUNT(distinct problem_id) as Solved,SUM(dateTimeOfSubmission) as TimeTaken").where('submissions.contest_id=? AND status="1"', params[:id]).group("submissions.user_id").order("COUNT(DISTINCT problem_id) desc, SUM(dateTimeOfSubmission) asc")
    @participant=Participant.new
  end

  # GET /contests/new
  def new
    @contest = Contest.new
  end

  # GET /contests/1/edit
  def edit
  end

  # POST /contests
  # POST /contests.json
  def create
  @contest = Contest.new(contest_params)
  civildate = "#{params[:contest]["startDateTime(1i)"].to_s}-#{params[:contest]["startDateTime(2i)"].to_s}-#{params[:contest]["startDateTime(3i)"].to_s} #{params[:contest]["startDateTime(4i)"].to_s}:#{params[:contest]["startDateTime(5i)"].to_s}"
  @contest.startDateTime= civildate
  civildate = "#{params[:contest]["endDateTime(1i)"].to_s}-#{params[:contest]["endDateTime(2i)"].to_s}-#{params[:contest]["endDateTime(3i)"].to_s} #{params[:contest]["endDateTime(4i)"].to_s}:#{params[:contest]["endDateTime(5i)"].to_s}"
  @contest.endDateTime = civildate


    respond_to do |format|
      if @contest.save
        format.html { redirect_to @contest, notice: 'Contest was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contest }
      else
        format.html { render action: 'new' }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contests/1
  # PATCH/PUT /contests/1.json
  def update
    respond_to do |format|
      if @contest.update(contest_params)
        format.html { redirect_to @contest, notice: 'Contest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    @contest.destroy
    respond_to do |format|
      format.html { redirect_to contests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_params
      params.require(:contest).permit(:contestName, :startDateTime, :endDateTime, :contestStatus, :user_id)
    end
end
