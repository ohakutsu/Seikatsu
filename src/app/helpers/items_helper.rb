# frozen_string_literal: true

module ItemsHelper
  def is_auther?(item)
    if current_user.present?
      item.user.hashid == current_user.hashid
    else
      false
    end
  end
end
