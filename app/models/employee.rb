class Employee < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search_by_employee_id, against: :employee_id
    pg_search_scope :search_by_first_name, against: :first_name
    pg_search_scope :search_by_designation, against: :designation
    
    has_secure_password
    has_many :messages, dependent: :delete_all
    has_many :participants, dependent: :delete_all
    has_many :joinables, dependent: :destroy
    has_many :joined_rooms, through: :joinables, source: :room

    has_many :notifications, dependent: :destroy, as: :recipient

    validates_uniqueness_of :username, :email
    validates_presence_of :first_name, :last_name, :username, :email, :employee_id, :join_date, :phone, :company

    scope :all_except, ->(employee) { where.not(id: employee) }
    after_create_commit { broadcast_append_to "employees" }
    after_update_commit { broadcast_update }

    enum role: %i[employee admin]
    enum status: %i[offline away online]

    after_initialize :set_default_role, if: :new_record?

    def broadcast_update
        broadcast_replace_to 'employee_status', partial: 'employees/status', employee: self
    end

    def has_joined_room(room)
        joined_rooms.include?(room)
    end

    def status_to_css
        case status
            when 'online'
                'bg-success'
            when 'away'
                'bg-warning'
            when 'offline'
                'bg-dark'
            else
                'bg-dark'
        end
    end

    private
        def set_default_role
            self.role ||= :employee
        end
end
