class CommentsController < ApplicationController
  before_action :set_report
  before_action :set_comment, only: %i(show edit update destroy)

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to report_path(@comment.report_id), notice: '作成しました'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to report_path(@comment.report_id), notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to report_path(@comment.report), notice: '削除しました'
  end

  private

  def set_report
    @report = Report.find(params[:report_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:report_id, :user_id, :description)
  end
end
