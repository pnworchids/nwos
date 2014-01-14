module ApplicationHelper

  def full_title(base_title = "NWOS", page_title)
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

  # ------- COLUMNS & LISTS

  def get_item_class(i, arr)
    klasses = i % 2 == 0 ? 'odd ' : 'even '
    klasses << 'first ' if i < 1
    klasses << 'last ' if i+1 == arr.length
    return klasses
  end

  def get_column_clear_class(i, column_num)
    # if multiple values are provided
    if column_num.kind_of?(Array)
      # check equation against each value
      klasses = ''
      column_num.each do |val|
        if i % val == 0
          klasses << ' first-of-'+val.to_s
        end
      end
      return klasses
    # otherwise just calculate for single value
    elsif i % column_num == 0
      return 'first-of-'+column_num.to_s
    end
  end

  # ------- FORMS

  def field_error_highlight(errors)
    'field_with_errors' unless errors.blank?
  end

  def field_error_message(errors)
    unless errors.blank?
      if errors.include?("can't be blank")
        # if it blank, just show the blank error
        render 'application/forms/field_error_message', errors: ["can't be blank"]
      else
        render 'application/forms/field_error_message', errors: errors
      end
    end
  end

  # ------- URLS

  def get_url(path = "")
    return request.protocol+ENV['DOMAIN_URL']+path.to_s
  end

  # builds link for Facebook Send Dialog (not to be confused with Facebook Send button)
  def construct_fb_send(path = "")
    return "https://www.facebook.com/dialog/send?app_id="+ENV['FB_APP_ID']+"&link="+get_url(path)+"&redirect_uri="+get_url(path)
  end

  # builds link for Custom Share button
  def construct_fb_share(path = "")
    return "https://www.facebook.com/sharer/sharer.php?u="+get_url(path).to_s
  end

  # builds link for Custom Tweet button
  def construct_tweet(path = "", text = ENV["TWEET_COPY_GENERAL"])
    return "https://twitter.com/share?url="+u(get_url(path))+"&text="+text
  end
end
