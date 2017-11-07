module UsersHelper
  def show_avatar_for user
    image_tag(user.avatar.url, class: "img-circle img-responsive", size: Settings.user.avatar.size_default)
  end

  def displayed_column_for_suppervisor
    User.column_names -
      %w(id reset_password_token reset_password_sent_at sign_in_count current_sign_in_at
       last_sign_in_at current_sign_in_ip last_sign_in_ip encrypted_password created_at updated_at
       remember_digest remember_created_at) +
      %w(action)
  end

  def displayed_column_for_user
    User.column_names -
      %w(id reset_password_token reset_password_sent_at sign_in_count current_sign_in_at
       last_sign_in_at current_sign_in_ip last_sign_in_ip encrypted_password created_at updated_at
       remember_digest remember_created_at) +
      %w(action)
  end

  def total_member trainers, trainees
    trainers.size + trainees.size
  end
end
