module ApplicationHelper
  require "uri"

  def text_url_to_link(text)
    URI.extract(text, %w[http https]).uniq.each do |url|
      sub_text = ""
      sub_text << "<a href=" << url << " target=\"_blank\">" << url << "</a>"

      text.gsub!(url, sub_text)
    end

    text
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
