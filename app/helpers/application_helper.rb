module ApplicationHelper
  def status_profiles profile
    profile.public_cv? ? t("public") : t("private") 
  end
  
  def user_apply? post
    current_user.user_applies.post_applies(post).present?
  end

  def qualification_time qualification
    return if qualification.start_time.blank?

    end_time = qualification.end_time || t("until_now")
    [l(qualification.start_time), end_time].join(" - ")
  end

  def applied_post_status post
    return if current_user.nil?
    apply_post = current_user.user_applies.find_by post_id: post
    apply_post.status if apply_post.present?
  end
end
