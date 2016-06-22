class MyReportsController < ApplicationController
  def index
    @my_reports = Report.where(user: current_user).page(params[:page]).order(created_at: :desc)
  end
end