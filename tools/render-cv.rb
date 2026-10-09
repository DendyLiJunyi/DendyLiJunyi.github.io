# Render only the standalone CV with the same Liquid templates used by Jekyll.
# Usage: ruby tools/render-cv.rb /private/tmp/junyi-cv.html
require 'yaml'
require 'liquid'
module CvFilters
  def relative_url(input)
    input # This site's baseurl is empty; the preview is standalone.
  end
end
Liquid::Template.register_filter(CvFilters)
root = File.expand_path('..', __dir__)
cv = YAML.safe_load_file(File.join(root, '_data/cv.yml'))
layout = File.read(File.join(root, '_layouts/cv-print.html'))
body = File.read(File.join(root, '_includes/cv-body.html'))
source = layout.sub('{% include cv-body.html %}', body)
html = Liquid::Template.parse(source, error_mode: :strict).render!(
  { 'site' => { 'lang' => 'en', 'data' => { 'cv' => cv } } },
  strict_filters: true
)
File.write(ARGV.fetch(0), html)
puts "Rendered #{ARGV[0]}"
