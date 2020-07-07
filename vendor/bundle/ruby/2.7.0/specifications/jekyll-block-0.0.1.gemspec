# -*- encoding: utf-8 -*-
# stub: jekyll-block 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-block".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/MaximeKjaer/jekyll-block/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/MaximeKjaer/jekyll-block", "source_code_uri" => "https://github.com/MaximeKjaer/jekyll-block" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Maxime Kjaer".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-01-28"
  s.description = "Adds a \"block\" Liquid tag to generate HTML for message boxes in Jekyll".freeze
  s.email = ["maxime.kjaer@gmail.com".freeze]
  s.homepage = "https://github.com/MaximeKjaer/jekyll-block".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Liquid tag for message boxes".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rubocop>.freeze, [">= 0.68.0", "< 0.72.0"])
    s.add_development_dependency(%q<rubocop-jekyll>.freeze, ["~> 0.10.0"])
    s.add_runtime_dependency(%q<jekyll>.freeze, [">= 3.6", "< 5.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rubocop>.freeze, [">= 0.68.0", "< 0.72.0"])
    s.add_dependency(%q<rubocop-jekyll>.freeze, ["~> 0.10.0"])
    s.add_dependency(%q<jekyll>.freeze, [">= 3.6", "< 5.0"])
  end
end
