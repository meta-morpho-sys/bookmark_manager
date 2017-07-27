feature 'Adding tags' do
  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'tags',  with: 'education'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
  end

#   As a time-pressed user
# So that I can organise my links into different categories for ease of search
# I would like to add tags to the links in my bookmark manager

  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.makersacademy.com/'
    fill_in 'title', with: 'Makers Academy'
    # our tags will be space separated
    fill_in 'tags',  with: 'education ruby'
    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education', 'ruby')
  end
end
