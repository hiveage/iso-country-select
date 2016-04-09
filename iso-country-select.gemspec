# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "iso-country-select"
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["mcasimir"]
  s.date = "2013-06-27"
  s.description = "Localized country select helper for rails that stores ISO 3166-1 alpha-3 country codes instead of names"
  s.email = "maurizio.cas@gmail.com"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "README.md",
    "Rakefile",
    "VERSION",
    "config/locales/da.yml",
    "config/locales/en.yml",
    "config/locales/es.yml",
    "config/locales/fr.yml",
    "config/locales/it.yml",
    "config/locales/ru.yml",
    "iso-country-select.gemspec",
    "lib/iso-country-select.rb",
    "lib/iso3166.rb"
  ]
  s.homepage = "http://github.com/mcasimir/kaminari-bootstrap"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Localized country select helper for rails that stores ISO 3166-1 alpha-3 codes"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

