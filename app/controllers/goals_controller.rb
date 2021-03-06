class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /goals
  # GET /goals.json
  def index
    @goals = current_user.goals.all
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    @goal = current_user.goals.build
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = current_user.goals.build(goal_params)

    # iterate throught dates
    puts goal_params[:start_date]
    puts goal_params[:duration]

    if goal_params[:start_date] != "" && goal_params[:duration] != ""
      start_date = Date.parse(goal_params[:start_date])
      end_date = start_date + goal_params[:duration].to_i - 1

      start_date.upto(end_date) do |date|
        @goal.activities.build({done: false, due_date: date})
      end
    end

    respond_to do |format|
      if @goal.save
        format.html { redirect_to goals_path, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to goals_path, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:title, :description, :start_date, :moment_start, :moment_end, :duration, :user_id)
    end
end
