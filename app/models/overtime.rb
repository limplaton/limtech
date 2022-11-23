class Overtime < ApplicationRecord
    validates_presence_of :name, :date, :hours, :description
end
