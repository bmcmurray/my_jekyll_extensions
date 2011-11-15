module Jekyll
  class Post
    def preview_content
      delimeter = @site.config['content_delimeter'] || '<!-- -**-END-**- -->'
      if self.content.length >= (@site.config['preview_minimum_length'] || 250)
        self.content.split(delimeter)[0]
      end
    end
  end

  AOP.around(Post, :to_liquid) do |post_instance, args, proceed, abort|
    result = proceed.call
    if post_instance.preview_content && !post_instance.preview_content.gsub(/\n/, '').strip.empty?
      result['preview'] = post_instance.preview_content
    end
    result
  end
end

