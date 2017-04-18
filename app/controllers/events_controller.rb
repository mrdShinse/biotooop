class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def UserEvent
    UserEvent
  end

  def open
    @uid = session['warden.user.user.key'][0][0]
    logger.debug(Date.today)
    @event = Event.find_by(date: Date.today)
    if @event
      @user_event = UserEvent.find_by(user_id: @uid, event_id: @event.id)
    else
      @event = nil
      @user_event = nil
    end
  end

  def join
    @user_event = UserEvent.new(events_params)
    respond_to do |format|
      if @user_event.save
        @event = Event.find(@user_event.event_id)

        @event.user_count = @event.user_count + 1
        if @event.save
          format.html { redirect_to open_events_url, notice: 'イベントに参加しました' }
          format.json { render template: 'events/open', status: :created, location: @user_event }
        else
          format.html { render template: 'events/open' }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      else
        format.html { render template: 'events/open' }
        format.json { render json: @user_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def cancel
    @user_event = UserEvent.find_by(events_params)
    @event = Event.find(@user_event.event_id)

    @user_event.destroy
    @event.user_count = @event.user_count - 1
    respond_to do |format|
      if @event.save
        format.html { redirect_to open_events_url, notice: 'イベントをキャンセルしました' }
        format.json { render template: 'events/open', status: :ok, location: @user_event }
      else
        format.html { render template: 'events/open' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date, :type, :area, :meeting_time, :meeting_place)
    end

    def events_params
      params.require(:events).permit(:user_id, :event_id)
    end
end
