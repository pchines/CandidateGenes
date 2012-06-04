module ApplicationHelper
  @@MAX = 100

  def short_text(text)
    if (text.nil?)
      return ""
    end
    short = text;
    short.sub!('<(br|p)>.*', '...')
    if short.length > @@MAX
      short = short[0,@@MAX-3] + '...'
    end
    return short;
  end
end
