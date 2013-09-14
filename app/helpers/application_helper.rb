module ApplicationHelper

  def full_title(base_title, page_title)
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def get_body_class
    klasses = controller.controller_name+'-'+controller.action_name
    klasses << ' '+controller.controller_name+'-page'
    return klasses
  end

  def convert_to_css_class(str = "")
    str.gsub(/[^0-9a-z ]/i, '').gsub(/\s+/, '-').downcase
  end

  def get_list_item_classes(i, arr)
    klasses = i % 2 == 0 ? 'odd ' : 'even '
    klasses << 'first ' if i < 1
    klasses << 'last ' if i+1 == arr.length
    return klasses
  end

  def get_url(path = "")
    if ENV['DEV_MODE'] = 'true'
      return request.protocol+ENV['HEROKU_URL']+path.to_s
    else
      return request.protocol+ENV['DOMAIN_URL']+path.to_s
    end
  end

  # builds link for Facebook Send Dialog (not to be confused with Facebook Send button)
  def construct_fb_send(path = "")
    return "https://www.facebook.com/dialog/send?app_id="+ENV['FB_APP_ID']+"&link="+get_url(path)+"&redirect_uri="+get_url(path)
  end

  # builds link for Custom Tweet button
  def construct_fb_share(path = "")
    return "https://www.facebook.com/sharer/sharer.php?u="+get_url(path).to_s
  end

  # builds link for Custom Tweet button
  def construct_tweet(path = "", text = ENV["TWEET_COPY_GENERAL"])
    return "https://twitter.com/share?url="+u(get_url(path))+"&text="+text
  end
end
