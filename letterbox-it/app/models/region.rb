class Region < ApplicationRecord
	has_and_belongs_to_many :users
	belongs_to :requests
	belongs_to :distribution
end
