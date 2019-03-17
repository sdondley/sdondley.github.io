source "https://rubygems.org"

gem "jekyll", "~> 3.8.4"
group :jekyll_plugins do
  gem "jekyll-sitemap", "~> 1.2.0"      # sitemap
  gem "jekyll-mathjax-csp", "~> 1.1.0"  # mathjax
  gem "jekyll-diagrams", "~> 0.4.2"     # graphviz
  gem "premonition", "~> 2.0.0"         # content blocks
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.0" if Gem.win_platform?


group :test do
	# For testing outputted HTML on Travis CI
	gem "rake"
	gem "html-proofer"
end
