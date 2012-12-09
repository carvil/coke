module TweetsHelper

  def style_message(message)
    if ["coke", "coca-cola", "diet cola"].any? {|str| message.downcase.include? str}
      content_tag :p, message, class: "red"
    else
      content_tag :p, message
    end
  end

  def to_img(sentiment)
    if sentiment <= -0.4
      return image_tag "negative.png"
    end
    if sentiment > -0.4 and sentiment <= 0.3
      return image_tag "neutral.png"
    end
    if sentiment > 0.3
      return image_tag "positive.png"
    end
  end

end
