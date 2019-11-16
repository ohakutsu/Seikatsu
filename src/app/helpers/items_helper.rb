# frozen_string_literal: true

module ItemsHelper
  def is_auther?(item)
    if current_user.present?
      item.user.hashid == current_user.hashid
    else
      false
    end
  end

  def is_votable?(item)
    if current_user.present?
      !current_user.voted_items.exists?(id: item.id)
    else
      true
    end
  end
end
