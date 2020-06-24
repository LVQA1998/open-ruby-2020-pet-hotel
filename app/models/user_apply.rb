class UserApply < ApplicationRecord
  USER_APPLY_PERMIT = %i(profile_id post_id).freeze
  
  belongs_to :user
  belongs_to :post
  belongs_to :profile

  enum status: {pending: 0, approved: 1}

  scope :post_applies, -> posts_id {where post_id: posts_id}

  delegate :title, to: :post, prefix: true
  delegate :username, to: :user, prefix: true
end
