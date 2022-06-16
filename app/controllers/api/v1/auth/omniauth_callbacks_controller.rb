
      class Api::V1::Auth::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

        def redirect_callbacks
          super
        end
     
        def omniauth_success
          super
        end
     
        def omniauth_failure
          super
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
      end
