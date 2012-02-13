# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "easyeditor/version"

Gem::Specification.new do |s|
  s.name        = "easyeditor"
  s.version     = Easyeditor::VERSION
  s.authors     = ["azhao"]
  s.email       = ["azhao.1981@gmail.com"]
  s.homepage    = "https://github.com/azhao1981/easyeditor"
  s.summary     = %q{Tool for easy to open Project file.}
  s.description = %q{ee path1/path2/filename will open which one that match *path1*/*path2*/*file.* }

  s.rubyforge_project = "easyeditor"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "awesome_print"
end
