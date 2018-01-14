class ProblemInContestsController < ApplicationController
  before_action :set_problem_in_contest, only: [:show, :edit, :update, :destroy]

  # GET /problem_in_contests
  # GET /problem_in_contests.json
  def index
    @problem_in_contests = ProblemInContest.all
  end

  # GET /problem_in_contests/1
  # GET /problem_in_contests/1.json
  def show
  end

  # GET /problem_in_contests/new
  def new
    @problem_in_contest = ProblemInContest.new
  end

  # GET /problem_in_contests/1/edit
  def edit
  end

  # POST /problem_in_contests
  # POST /problem_in_contests.json
  def create
    @problem_in_contest = ProblemInContest.new(problem_in_contest_params)

    respond_to do |format|
      if @problem_in_contest.save
        format.html { redirect_to Contest.find(@problem_in_contest.contest_id), notice: 'Problem in contest was successfully created.' }
        format.json { render action: 'show', status: :created, location: @problem_in_contest }
      else
        format.html { redirect_to Contest.find(@problem_in_contest.contest_id), notice: 'Problem is already present in contest' }
        format.json { render json: @problem_in_contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problem_in_contests/1
  # PATCH/PUT /problem_in_contests/1.json
  def update
    respond_to do |format|
      if @problem_in_contest.update(problem_in_contest_params)
        format.html { redirect_to @problem_in_contest, notice: 'Problem in contest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @problem_in_contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problem_in_contests/1
  # DELETE /problem_in_contests/1.json
  def destroy
    @problem_in_contest.destroy
    respond_to do |format|
      format.html { redirect_to problem_in_contests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem_in_contest
      @problem_in_contest = ProblemInContest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_in_contest_params
      params.require(:problem_in_contest).permit(:problem_id, :contest_id)
    end
end
