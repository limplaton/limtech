class RoomsController < ApplicationController
    include RoomsHelper
    before_action :set_status

    def index
        @current_user = current_user
        redirect_to '/signin' unless @current_user
        @chatroom = true;

        @joined_rooms = current_user.joined_rooms.order('last_message_at DESC')
        @rooms = search_rooms
        current_user.update(current_room: nil)

        @users = Employee.all_except(@current_user)
        @room = Room.new
    end

    def create
        @room = Room.create(name: params["room"]["name"])
        redirect_to @room
    end

    def show
        @current_user = current_user
        @single_room = Room.find(params[:id])
        current_user.update(current_room: @single_room)

        @room = Room.new
        @joined_rooms = current_user.joined_rooms.order('last_message_at DESC')
        @rooms = search_rooms

        @chatroom = true;
        
        @message = Message.new

        pagy_messages = @single_room.messages.includes(:employee).order(created_at: :desc)
        @pagy, messages = pagy(pagy_messages, items: 15)
        @messages = messages.reverse

        @video_call === nil
        @incoming === nil

        # @messages = @single_room.messages.order(created_at: :asc)
      
        @users = Employee.all_except(@current_user)
        
        set_notifications_to_read

        render "index"
    end

    def search
        @rooms = search_rooms
        respond_to do |format| 
            format.turbo_stream do
                render turbo_stream: [
                    turbo_stream.update('search_results', partial: 'rooms/search_results', locals: {rooms: @rooms})
                ]
            end
        end
    end

    def join
        @room = Room.find(params[:id])
        current_user.joined_rooms << @room
        redirect_to @room
    end
    
    def leave
        @room = Room.find(params[:id])
        current_user.joined_rooms.delete(@room)
        redirect_to rooms_path
    end

    def call
        redirect_to "/employees/calls/#{SecureRandom.uuid}"
    end

    def video
        # @video_call = truesssss

        @client = Client.new(id: SecureRandom.uuid)
        cookies.encrypted[:client_id] = @client.id
        @room_video = Room.new(id: params[:id])

        # @incoming = true

        # @current_user = current_user
        # # @user = Employee.find(params[:id])
        
        # # @single_room = Room.find(params[:id])
        # # current_user.update(current_room: @single_room)

        # @room = Room.new
        # @joined_rooms = current_user.joined_rooms.order('last_message_at DESC')
        # @rooms = search_rooms

        @chatroom = true;
        
        # @message = Message.new

        # # pagy_messages = @single_room.messages.includes(:employee).order(created_at: :desc)
        # # @pagy, messages = pagy(pagy_messages, items: 15)
        # # @messages = messages.reverse

        # # @messages = @single_room.messages.order(created_at: :asc)
      
        # @users = Employee.all_except(@current_user)
        
        # set_notifications_to_read

        # render "index"
    end

    private

        def set_status
            current_user.update!(status: Employee.statuses[:online]) if current_user
        end

        def set_notifications_to_read
            notifications = @single_room.notifications_as_room.where(recipient: current_user).unread
            notifications.update_all(read_at: Time.zone.now)
        end
end
