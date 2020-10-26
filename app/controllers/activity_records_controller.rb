class ActivityRecordsController < ApplicationController
  before_action :set_activity_record, only: [:show, :edit, :update, :destroy]
  before_action :get_activities, only: [:edit, :update, :create, :new, :index]
  before_action :authorize_user, only: [:index, :show, :edit, :update, :destroy]

  # GET /activity_records
  # GET /activity_records.json
  def index
    # @activity_records = ActivityRecord.all
    @activity_records = ActivityRecord.all()
    # @activities = Activity.find(params[])w
    # @activity_records = User.joins(:activity_records).group('users.id').having('count(user_id) > n')

  end

  # GET /activity_records/1
  # GET /activity_records/1.json
  def show
  end

  # GET /activity_records/new
  def new
    @activity_record = ActivityRecord.new
  end

  # GET /activity_records/1/edit
  def edit
  end

  # POST /activity_records
  # POST /activity_records.json
  def create
    @activity_record = ActivityRecord.new(activity_record_params)
    @activity_record.user = current_user

    respond_to do |format|
      if @activity_record.save
        format.html { redirect_to @activity_record, notice: 'Activity record was successfully created.' }
        format.json { render :show, status: :created, location: @activity_record }
      else
        format.html { render :new }
        format.json { render json: @activity_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_records/1
  # PATCH/PUT /activity_records/1.json
  def update
    respond_to do |format|
      if @activity_record.update(activity_record_params)
        format.html { redirect_to @activity_record, notice: 'Activity record was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_record }
      else
        format.html { render :edit }
        format.json { render json: @activity_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_records/1
  # DELETE /activity_records/1.json
  def destroy
    @activity_record.destroy
    respond_to do |format|
      format.html { redirect_to activity_records_url, notice: 'Activity record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_record
      @activity_record = ActivityRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_record_params
      params.fetch(:activity_record, {}).permit(:Date, :duration, :comment, :activity_id)
    end

    def get_activities
      @activities = Activity.all
    end
    
    def authorize_user
      redirect_to(user_session_path, alert: 'Your custom message here') unless user_signed_in?
    end
end
