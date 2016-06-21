class WelcomeController < ApplicationController
  def index
    @reports = Report.page(params[:page]).order(created_at: :desc)
  end
end
