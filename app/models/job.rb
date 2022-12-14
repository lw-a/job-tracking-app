class Job < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :emails, dependent: :destroy
  validates :title, :status, :company, :url, presence: true
  enum status: { pending: 0, applied: 1, interview: 2, offer: 3, rejected: 4 }, _default: 0
  has_one_attached :cv
  has_one_attached :cover_letter
  has_one_attached :job_posting
  has_one_attached :company_logo

  def status_id
   statuses = ["pending", "applied", "interview", "offer", "rejected"]
   statuses[statuses.index(self.status) + 1]
  end
end
