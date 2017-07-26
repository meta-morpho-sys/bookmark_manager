=begin
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to my bookmark manager
=end

feature 'Creating links' do
  scenario "I can add site's address and title" do
    visit '/links/new'
    fill_in 'url', with: 'http://www.zom'
  end
end
