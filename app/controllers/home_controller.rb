class HomeController < ApplicationController
  before_action :forbid_login_user,{only: [:top]}
  def top
  end

  def terms
  end

  def owner
  end
end
