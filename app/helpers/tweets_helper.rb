module TweetsHelper

  def style_message(message)
    if ["coke", "coca-cola", "diet cola"].any? {|str| message.downcase.include? str}
      content_tag :p, message, class: "red"
    else
      content_tag :p, message
    end
  end

end
