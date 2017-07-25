=begin
- As a Makers student
  So that I can find useful information easily
  I need to see a list of links homepage
=end

feature 'Viewing links' do
  scenario 'I can see existing links on the links homepage' do
    #use `.create` , like in DataMapper, within the test.
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links'

  expect(page.status_code).to eq 200
  within 'ul#links' do

    expect(page).to have_content('Makers Academy')
  end
  end
end
