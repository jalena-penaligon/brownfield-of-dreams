# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  include ControllerHelper
  before_action :require_admin!
end
