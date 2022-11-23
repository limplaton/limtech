class HolidaysController < ApplicationController
    before_action :set_holiday, only: %i[ show edit update destroy ]
    require 'rest-client'
    require "active_support/time"

    # GET /holidays or /holidays.json
    def index
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @pagy, @holidays = pagy(Holiday.all, items: 3)
        response = RestClient.get("https://holidayapi.com/v1/holidays?pretty&key=f76f1b99-f92c-4bd1-be1a-1dc6ddc22931&country=PH&year=2021")
        @test = JSON.parse(response)
        @pagy, @all_holiday = pagy_array(@test['holidays'], items: 10)
    end

    # GET /holidays/1 or /holidays/1.json
    def show
    end

    # GET /holidays/new
    def new
        @holiday = Holiday.new
    end

    # GET /holidays/1/edit
    def edit
    end

    # POST /holidays or /holidays.json
    def create
        @holiday = Holiday.new(holiday_params)

        respond_to do |format|
            if @holiday.save
                format.html { redirect_to holidays_url, notice: "Holiday was successfully created." }
                format.json { render :show, status: :created, location: @holiday }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @holiday.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /holidays/1 or /holidays/1.json
    def update
        respond_to do |format|
            if @holiday.update(holiday_params)
                format.html { redirect_to holidays_url, notice: "Holiday was successfully updated." }
                format.json { render :show, status: :ok, location: @holiday }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @holiday.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /holidays/1 or /holidays/1.json
    def destroy
        @holiday.destroy

        respond_to do |format|
            format.html { redirect_to holidays_url, notice: "Holiday was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_holiday
            @holiday = Holiday.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def holiday_params
            params.require(:holiday).permit(:name, :date)
        end
end
