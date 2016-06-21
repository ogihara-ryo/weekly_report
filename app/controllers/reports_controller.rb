class ReportsController < ApplicationController
  before_action :set_report, only: %i(show edit update destroy)

  def index
    @reports = Report.page(params[:page]).order(created_at: :desc)
  end

  def show
    @comment = Comment.new
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

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:user_id, :place, :overwork, :work, :probrem, :solution, :plan, :other)
  end
end
