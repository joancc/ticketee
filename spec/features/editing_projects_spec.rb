require 'spec_helper'

feature "Editing Projects" do

	before do
		# 1) Arrange
		FactoryGirl.create(:project, name: "TextMate 2")	

		# 2) Act
		visit "/"
		click_link "TextMate 2"
		click_link "Edit Project"
	end

	scenario "Updating a project" do
		fill_in "Name", with: "TextMate 2 beta"
		click_button "Update Project"

		# 3) Assert
		expect(page).to have_content("Project has been updated.")
	end

	scenario "Invalid attributes. Item not updated" do
		fill_in "Name", with: ""
		click_button "Update Project"

		expect(page).to have_content("Project has not been updated.")
	end
end