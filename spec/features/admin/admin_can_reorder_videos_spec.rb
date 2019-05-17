# require 'rails_helper'
# require "capybara/dsl"
# require 'selenium/webdriver'
#
# describe 'as an admin' do
#   let(:tutorial) { create(:tutorial) }
#   let(:vid_1)    { create(:video, tutorial: tutorial, position: 1) }
#   let(:vid_2)    { create(:video, tutorial: tutorial, position: 2) }
#   let(:vid_3)    { create(:video, tutorial: tutorial, position: 3) }
#
#   it 'can reorder videos' do
#
#     sequence = [vid_1.id, vid_2.id, vid_3.id]
#
#     sess = Capybara::Session.new(:selenium_chrome)
#     sess.visit("http://localhost:3000/login")
#     sess.fill_in('Email', with: 'admin@example.com')
#     sess.fill_in('Password', with: 'password')
#     sess.click_on("Log In")
#     sess.visit("http://localhost:3000/admin/tutorials/1/edit")
#
#     src = sess.first('.video')
#     dest = sess.first('.video:nth-child(2)')
#     src.drag_to dest
#     sleep 5 # keep session open so we can see it has dragged
#
#     sess.click_on "Save Video Order"
#   end
# end
