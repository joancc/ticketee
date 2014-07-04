require 'spec_helper'

feature 'Creating Pojects'  do
	scenario "can create a project" do
		visit '/'
		click_link 'New Project'

		fill_in 'Name', with: "TextMate 2"
		fill_in 'Description', with: "Some text editor"

		click_button 'Create Project'

		expect(page).to have_content("Project has been created.")	# :notice when creating instance
	end
end