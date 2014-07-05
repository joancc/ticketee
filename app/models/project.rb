class Project < ActiveRecord::Base
	validates :name, presence: true

	# has_many enables the use of the method "build", called in the new method
	# of tickets_controller.rb 
	has_many :tickets
end
