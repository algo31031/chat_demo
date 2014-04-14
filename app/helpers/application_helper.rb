# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def broadcast(channel, user_id, &block)
    message = {:channel => channel, :data => {:post => capture(&block), :user_id => user_id}}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

end
