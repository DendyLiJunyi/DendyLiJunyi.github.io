#!/usr/bin/env ruby
#
# Check for changed posts

require 'open3'

Jekyll::Hooks.register :posts, :post_init do |post|
  history_for = lambda do |path|
    output, status = Open3.capture2(
      'git', 'log', '--follow', '-2', '--pretty=%ad', '--date=iso', '--', path,
      chdir: post.site.source
    )
    status.success? ? output.lines.map(&:strip) : []
  end

  history = history_for.call(post.path)
  # Also preserve dates while a move from the former flat layout is uncommitted.
  if history.empty?
    history = history_for.call(File.join('_posts', File.basename(post.path)))
  end

  post.data['last_modified_at'] = history.first if history.length > 1
end
