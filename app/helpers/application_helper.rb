module ApplicationHelper
  def default_meta_tags
    {
      site: 'BOIトレ',
      title: '~母音法で発声練習~',
      charset: 'utf-8',
      description: 'BOIトレは劇団四季も使っている母音法で練習する、発声練習・滑舌改善サービスです。',
      keywords: 'BOIトレ, 母音法, 発声練習',
      canonical: request.original_url,
      icon: [
        { href: image_url('favicon.ico') }
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
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
