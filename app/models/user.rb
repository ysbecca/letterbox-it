class User < ApplicationRecord
	include Clearance::User
	has_and_belongs_to_many :regions
	has_many :requests

end