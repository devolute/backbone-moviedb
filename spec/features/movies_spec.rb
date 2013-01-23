require 'spec_helper'

feature "listing movies", :js => true do

    scenario "shows a list of all movies" do
      visit "/movies"
      sleep 5
      page.should have_content("Movies")
    end

	
end
