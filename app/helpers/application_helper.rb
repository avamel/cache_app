module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def cache_key_for_articles
    count          = Article.count
    max_updated_at = Article.maximum(:updated_at).try(:utc).try(:to_s, :number)
    user_updated_at = User.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "articles/all-#{count}-#{max_updated_at}-#{user_updated_at}"
  end

  def key_user_articles
    article_updated_at = Article.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "user_article/all-#{article_updated_at}"
  end

end
