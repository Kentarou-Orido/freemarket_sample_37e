# -*- encoding: utf-8 -*-
# stub: ancestry 3.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "ancestry"
  s.version = "3.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/stefankroes/ancestry/issues", "changelog_uri" => "https://github.com/stefankroes/ancestry/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/stefankroes/ancestry", "source_code_uri" => "https://github.com/stefankroes/ancestry/" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Stefan Kroes", "Keenan Brock"]
  s.date = "2018-11-06"
  s.description = "  Ancestry allows the records of a ActiveRecord model to be organized in a tree\n  structure, using a single, intuitively formatted database column. It exposes\n  all the standard tree structure relations (ancestors, parent, root, children,\n  siblings, descendants) and all of them can be fetched in a single sql query.\n  Additional features are named_scopes, integrity checking, integrity restoration,\n  arrangement of (sub)tree into hashes and different strategies for dealing with\n  orphaned records.\n"
  s.email = "keenan@thebrocks.net"
  s.homepage = "https://github.com/stefankroes/ancestry"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "2.5.1"
  s.summary = "Organize ActiveRecord model into a tree structure"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.2.0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<test-unit>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.2.0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<test-unit>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.2.0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<test-unit>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
  end
end
