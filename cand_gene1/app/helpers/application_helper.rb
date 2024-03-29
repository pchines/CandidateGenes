module ApplicationHelper
  @@MAX = 200
  @@MAX_URL_LENGTH = 20

  def html_text(text)
    if (text.nil?)
      return ""
    end
    return text.html_safe
  end

  def short_text(text)
    if (text.nil?)
      return ""
    end
    short = text.sub(/(<(br|p)>|\.\s).*/, '...')
    if short.length > @@MAX
      short = short[0,@@MAX-3] + '...'
    end
    return short
  end

  def short_url(url)
    if (url.nil?)
      return ""
    end
    short = url.sub(/^https?:\/\//, '')
    if short.length > @@MAX_URL_LENGTH
      short = short[0,@@MAX_URL_LENGTH] + '...'
    end
    return short
  end

  def format_float(val,prec=1)
    return val.nil? ? "" : sprintf("%.#{prec}f", val)
  end
end
