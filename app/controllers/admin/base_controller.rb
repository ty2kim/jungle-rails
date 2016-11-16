module Admin
  # class Admin::BaseController
  class BaseController < ApplicationController
    http_basic_authenticate_with name: ENV['AUTH_USERNAME'], password: ENV['AUTH_PASSWORD']
  end
end
