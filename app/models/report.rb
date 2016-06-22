class Report < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  def previous
    Report.where('id < ?', self.id).order(created_at: :desc, id: :desc).first
  end

  def next
    Report.where('id > ?', self.id).order(created_at: :desc, id: :desc).reverse.first
  end
end
