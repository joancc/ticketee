require 'spec_helper'

describe User do
	describe "passwords" do
		it "needs a password and confirmation to save" do
			u=User.new(name:"me")

			u.save
			expect(u).to_not be_valid

			u.password = "password"
			u.password_confirmation = ""
			u.save
			expect(u).to_not be_valid

			u.password_confirmation = "password"
			u.save
			expect(u).to be_valid
		end

		it "needs password and confirmation to match" do
			u = User.create(name: "me",
				password: "password1",
				password_confirmation: "password2")
			expect(u).to_not be_valid
		end
	end

	describe "authentication" do
		let(:user) { User.create(name: "me",
								password: "password",
								password_confirmation: "password") }			

		it "authenticates with a correct password" do
			expect(user.authenticate("password")).to be
		end

		it "does not authenticate with an incorrect password" do
			expect(user.authenticate("passwordWrong")).to_not be
		end
	end
end