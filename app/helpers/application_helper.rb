module ApplicationHelper

  def outputting_error_message(other)
    if other.errors.any?
        content_tag(:div, class: "l-single__errors") do
          concat content_tag(:h2, "#{other.errors.full_messages.count}件のエラーが発生しました。")
          concat( content_tag(:ul) do
            other.errors.full_messages.each do |message|
            concat  content_tag(:li, "#{message}")
            end
          end)
        end
    end
  end

  def confirming_login_for_head_bar
    if user_signed_in?
      render "default/default-header-login"
    else
      render "default/default-header-not-login"
    end
  end
end
