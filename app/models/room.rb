class Room < ApplicationRecord
    has_many :messages
    has_many :participants, dependent: :destroy
    has_many :joinables, dependent: :destroy
    has_many :joined_employee, through: :joinables, source: :employee

    has_noticed_notifications model_name: 'Notification'

    validates_uniqueness_of :name
    scope :public_rooms, -> { where(is_private: false) }
    after_update_commit { broadcast_if_public }
    

    def broadcast_if_public
        broadcast_latest_message
    end

    def self.create_private_room(users, room_name)
        single_room = Room.create(name: room_name, is_private: true)
        users.each do |user|
            Participant.create(employee_id: user.id, room_id: single_room.id )
        end
        single_room
    end

    def participants?(room, user)
        room.participants.where(employee: user).exists?
        # Participant.where(employee_id: user.id, room_id: room.id).exists?
    end

    def latest_message
        messages.includes(:employee).order(created_at: :desc).first
    end

    def broadcast_latest_message
        last_message = latest_message

        return unless last_message
    
        room_target = "room_#{id} last_message"
        user_target = "room_#{id} user_last_message"
        sender = Current.employee.eql?(last_message.employee) ? Current.employee : last_message.employee

        broadcast_update_to('rooms',
                            target: room_target,
                            partial: 'rooms/last_message',
                            locals: {
                               last_message: last_message,
                               employee: last_message.employee,
                               room: self
                            })

        broadcast_update_to('rooms',
                            target: user_target,
                            partial: 'employees/last_message',
                            locals: {
                                last_message: last_message,
                                employee: last_message.employee,
                                room: self,
                                sender: sender
                            })
      end
end
