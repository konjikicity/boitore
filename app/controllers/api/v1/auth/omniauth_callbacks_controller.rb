class Api::V1::Auth::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
  def omniauth_success
    super
    @resource.update(nickname: @resource.name)
  end

  protected

  def assign_provider_attrs(user, auth_hash)
    case auth_hash['provider']
    when 'twitter'
      user.assign_attributes({
        nickname: auth_hash['info']['nickname'],
        name: auth_hash['info']['name'],
        image: auth_hash['info']['image'],
        email: auth_hash['info']['email']
      })
    when 'google'
      user.assign_attributes({
        nickname: auth_hash['info']['nickname'],
        name: auth_hash['info']['name'],
        image: auth_hash['info']['image'],
        email: auth_hash['info']['email']
      })
    else
      super
    end
  end
  
  def clean_resource
    @resource.name = strip_emoji(@resource.name)
    @resource.nickname = strip_emoji(@resource.nickname)
  end

  def strip_emoji(str)
    str.encode('SJIS', 'UTF-8', invalid: :replace, undef: :replace,
                                replace: '').encode('UTF-8')
  end
end
