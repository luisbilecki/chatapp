module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.nick_name
    puts Digest::MD5.hexdigest(user.email)
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
              opts
  end

  def flash_class(level)
    case level
        when 'notice' then 'alert alert-info'
        when 'success' then 'alert alert-success'
        when 'error' then 'alert alert-error'
        when 'alert' then 'alert alert-error'
    end
  end
end
