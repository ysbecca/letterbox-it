class Request < ApplicationRecord
	belongs_to :user
	has_one :region
end
