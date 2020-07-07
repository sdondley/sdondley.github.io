# -*- encoding: utf-8 -*-
# stub: jekyll-mathjax-csp 1.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "jekyll-mathjax-csp".freeze
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Fabian Henneke".freeze]
  s.date = "2020-05-25"
  s.description = "Server-side MathJax rendering for Jekyll with a strict CSP".freeze
  s.email = "fabian@henneke.me".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "https://github.com/FabianHenneke/jekyll-mathjax-csp".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Server-side MathJax & CSP for Jekyll".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<html-pipeline>.freeze, ["~> 2.12"])
    s.add_runtime_dependency(%q<jekyll>.freeze, [">= 3.0", "< 5.0"])
  else
    s.add_dependency(%q<html-pipeline>.freeze, ["~> 2.12"])
    s.add_dependency(%q<jekyll>.freeze, [">= 3.0", "< 5.0"])
  end
end
