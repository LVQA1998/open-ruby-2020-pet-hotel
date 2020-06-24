module ApplicationHelper
  def status_profiles profile
    profile.public_cv? ? t("public") : t("private") 
  end

  def user_apply? post
    current_user.user_applies.post_applies(post).present?
  end
end
