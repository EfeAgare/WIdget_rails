require 'rails_helper'


feature 'User visit the app' do
  scenario 'they see the general index page' do
    get_all_widgets
    visit root_path
   

    expect(page).to have_css('.display-4', text: 'Welcome to widget')
    expect(page).to have_css('.lead', text: 'Share your widget with the world')
    expect(page).to have_css('.col-sm-3')
  end


  scenario 'they click on a card and are redirected' do
    get_all_widgets
    visit root_path
    

    all('.card')[1].find('.card-link', match: :first).click
    expect(page).to have_css('.display-4', text: 'Welcome to widget')
  end
end