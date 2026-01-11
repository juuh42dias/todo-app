class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 1000 }

  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
  scope :ordered, -> { order(:position, :created_at) }

  before_validation :set_defaults

  private

  def set_defaults
    self.completed ||= false
    self.position ||= 0
  end
end

