require 'rails_helper'

RSpec.describe 'CreateArticles', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'Create article' do
    user1 = User.create(email: 'user1@email.com', password: '123456')
    Category.create(name: 'Competitions', priority: 1)
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    click_link_or_button 'New Article'
    fill_in 'article[title]', with: 'Test name'
    fill_in 'article[text]', with: 'Test article body'
    attach_file('article[image]', "#{Rails.root}/docs/ERD.png")
    click_button 'Create'
    expect(page).to have_text('Your article has been submitted!')
  end

  it 'Create article' do
    user1 = User.create(email: 'user1@email.com', password: '123456')
    Category.create(name: 'Competitions', priority: 1)
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    click_link_or_button 'New Article'
    fill_in 'article[title]', with: 'Test name2'
    fill_in 'article[text]', with: 'Test article body2'
    attach_file('article[image]', "#{Rails.root}/docs/ERD.png")
    click_button 'Create'
    expect(page).to have_text('Your article has been submitted!')
  end
end
