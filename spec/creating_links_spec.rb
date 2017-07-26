=begin
As a time-pressed user
So that I can save a website
I would like to add the site's address and title to my bookmark manager
=end

feature 'Creating links' do
  scenario "I can add site's address and title" do
    visit '/links/new'
    fill_in 'url', with: 'http://www.zombo.com'
    fill_in 'title', with: 'This is Zombocom'
    click_button 'Create link'

    #we expect to be redirected to the links page
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('This is Zombocom')
    end
  end
end
