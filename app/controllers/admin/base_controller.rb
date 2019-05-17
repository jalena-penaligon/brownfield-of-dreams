require_relative '../concerns/controller_helper'

class Admin::BaseController < ApplicationController
  include ControllerHelper
  before_action :require_admin!
end
