
      class Api::V1::Auth::OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController

        def redirect_callbacks
          super
        end
        def omniauth_success
          super
          @resource.update(nickname: @resource.name)
        end
        def omniauth_failure
          super
        end

        protected

          def render_data_or_redirect(message, data, user_data = {})
              if ['inAppBrowser', 'newWindow'].include?(omniauth_window_type)
                render_data(message, user_data.merge(data))
              elsif auth_origin_url
                redirect_to DeviseTokenAuth::Url.generate(auth_origin_url, data.merge(blank: true))
              else
                fallback_render data[:error] || 'An error occurred'
              end
          end

          def clean_resource
            @resource.name = strip_emoji(@resource.name)
            @resource.nickname = strip_emoji(@resource.nickname)
          end
          def strip_emoji(str)
            str.encode('SJIS', 'UTF-8', invalid: :replace, undef: :replace, replace: '').encode('UTF-8')
          end
      end
