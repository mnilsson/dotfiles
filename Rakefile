desc "link vimrc to ~/.vimrc"
task :link_vimrc do
  vimdir = File.expand_path("~/.vim")
  unless Dir.exist?(vimdir)
    ln_s(File.expand_path("./dot_vim"), vimdir)
  end
  %w[ vimrc gvimrc ].each do |file|
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
	  ln_s(File.expand_path("../#{file}", __FILE__), dest)
    end
  end
end

task :default => [
  :link_vimrc,
]
