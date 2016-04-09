module Supplier::ApplicationHelper
  def avatar_url(user)
    default_url = "#{root_url}images/person_placeholder.png"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=200"
  end

  def contact_full_name(contact)
    full_name = contact.first_name + " " + contact.last_name
    return full_name
  end
end
