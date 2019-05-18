# frozen_string_literal: true

class AdminDashboardFacade
  def tutorials
    Tutorial.all
  end
end
