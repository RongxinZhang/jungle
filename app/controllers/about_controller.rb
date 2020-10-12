class AboutController < ApplicationController
  def index
    @admin_name = ENV["ADMIN_USERNAME"]
  end
end
