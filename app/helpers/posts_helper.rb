module PostsHelper

  def render_post_content(post)
    truncate(simple_format(post.content), :length => 50)
  end
end
