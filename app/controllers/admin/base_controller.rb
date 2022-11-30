class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  layout :determine_layout

  def determine_layout
    "admin"
  end
end
