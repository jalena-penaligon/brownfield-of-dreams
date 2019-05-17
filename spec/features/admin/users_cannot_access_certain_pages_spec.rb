require 'rails_helper'

describe 'as a user or visitor' do
  describe 'if I try to view an admin page' do
    it 'displays a 404 error message' do
      visit new_admin_tutorial_path

      expect(page.status_code).to eq(404)

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_path
      expect(page.status_code).to eq(404)
    end
  end
end
