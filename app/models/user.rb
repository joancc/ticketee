class User < ActiveRecord::Base
	# Turn on password funcionality
	has_secure_password
end
