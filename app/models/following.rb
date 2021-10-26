# frozen_string_literal: true

class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'

  validates :following_id, uniqueness: { scope: :follower_id }
end
