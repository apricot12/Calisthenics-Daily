require 'rails_helper'

RSpec.describe 'CreateCategories', type: :feature do
  it 'Create category' do
    user1 = User.create(email: 'user1@email.com', password: '123456')
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    click_link_or_button 'New Category'
    fill_in 'category[name]', with: 'Competitions'
    click_button 'Create'
    expect(page).to have_text('New category created!')
  end

  it 'Create category' do
    user1 = User.create(email: 'user1@email.com', password: '123456')
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    click_link_or_button 'New Category'
    fill_in 'category[name]', with: 'Diet'
    click_button 'Create'
    expect(page).to have_text('New category created!')
  end

  it 'Create category' do
    user1 = User.create(email: 'user1@email.com', password: '123456')
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user1.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    click_link_or_button 'New Category'
    fill_in 'category[name]', with: 'Equipment'
    click_button 'Create'
    expect(page).to have_text('New category created!')
  end
end
