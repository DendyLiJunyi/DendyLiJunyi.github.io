#!/usr/bin/env ruby
#
# Check for changed posts

require 'open3'

Jekyll::Hooks.register :posts, :post_init do |post|
  history_for = lambda do |path|
    output, status = Open3.capture2(
      'git', 'log', '--follow', '--pretty=commit-date:%ad', '--date=iso',
      '--numstat', '--', path,
      chdir: post.site.source
    )
    next [] unless status.success?

    # A folder-only move must not appear as a new content update.
    date = nil
    output.lines.filter_map do |line|
      if line.start_with?('commit-date:')
        date = line.delete_prefix('commit-date:').strip
        next
      end

      added, removed = line.split("\t", 3)
      date if added.to_i.positive? || removed.to_i.positive?
    end
  end

  history = history_for.call(post.path)
  # Also preserve dates while a move from the former flat layout is uncommitted.
  if history.empty?
    history = history_for.call(File.join('_posts', File.basename(post.path)))
  end

  post.data['last_modified_at'] = history.first if history.length > 1
end
