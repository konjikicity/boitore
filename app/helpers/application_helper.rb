module ApplicationHelper
  def default_meta_tags
    {
      site: 'BOIトレ',
      title: 'BOIトレ ~母音法で発声練習~',
      description: 'BOIトレは劇団四季も使っている母音法で練習する、発声練習・滑舌改善サービスです。',
      canonical: request.original_url,   # 優先するurlを指定する
      noindex: !Rails.env.production?,
      charset: 'UTF-8',
      og: {
        title: :title,
        description: :description,
        type: 'website',
        site_name: :site,
        url: request.original_url,
        image: image_url('boitore_ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        creater: '@konjikicity',
        image: image_url('boitore_ogp.png')
      }
    }
  end
end
