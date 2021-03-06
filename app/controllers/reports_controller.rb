class ReportsController < ApplicationController
  before_action :set_report, only: %i(show edit update destroy)

  def index
    @reports = Report.page(params[:page]).order(created_at: :desc)
  end

  def show
    @comment = Comment.new
    @reports = Report.all
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to @report, notice: '作成しました'
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to @report, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: '削除しました'
  end

  def latest_report
    @latest_report = Report.where(user: current_user).order(:created_at).last
    if @latest_report
      render json: @latest_report and return if request.xhr?
    else
      render json: Report.new and return request.xhr?
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:user_id, :place, :overwork, :work, :probrem, :solution, :plan, :other)
  end
end
