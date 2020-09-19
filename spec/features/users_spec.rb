# require 'rails_helper'

# RSpec.feature "Studies", type: :feature do
#   scenario "user login" do
#     user = FactoryBot.create(:user)
#     user2 = FactoryBot.create(:user)

#     visit root_path
#     click_link "ログイン"
#     find('div.session').fill_in "email", with: user.email
#     find('div.session').fill_in "Password", with: user.password
#     click_button "ログイン"

#     expect(page).to have_content 'Signed in successfully'
#   end
#   scenario "user follow" do
#     user = FactoryBot.create(:user)
#     user2 = FactoryBot.create(:user)
#     visit root_path
#     click_link "ログイン"
#     find('div.session').fill_in "Email", with: user.email
#     find('div.session').fill_in "Password", with: user.password
#     click_button "ログイン"
#     visit user_path(user2.id)
#     click_link "フォロー"
#     expect(page).to have_content 'フォロー中'
#   end
# end
