# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def owner?(other_user)
    user == other_user
  end

  def created_on
    created_at.to_date
  end
end
