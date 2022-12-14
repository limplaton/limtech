class Message < ApplicationRecord
    belongs_to :employee
    belongs_to :room
    
    # validates_presence_of :content
    before_create :confirm_participant
    has_many_attached :attachments, dependent: :destroy

    after_create_commit do
        notify_recipients
        update_parent_room
        broadcast_append_later_to self.room
    end

    def chat_attachment(index)
        target = attachments[index]
        return unless attachments.attached?
    
        if target.image?
            target.variant(resize_to_limit: [150, 150]).processed
        elsif target.video?
            target.variant(resize_to_limit: [150, 150]).processed
        end
    end

    def confirm_participant
        if self.room.is_private
            is_participant = Participant.where(employee_id: self.employee.id, room_id: self.room.id).first
            throw :abort unless is_participant
        end
    end

    def update_parent_room
        room.update(last_message_at: Time.now)
    end

    private

        def notify_recipients
            users_in_room = room.joined_employee
            users_in_room.each do |user|
                next if user.eql?(self.employee)

                notification = MessageNotification.with(message: self, room:)
                notification.deliver_later(user)
            end
        end
end
