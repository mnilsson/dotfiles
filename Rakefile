task :install do
  linkables = Dir.glob '*/**{.symlink}'
  skip_all = false
  overwrite_all = false
  backup_all = false

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.symlink').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "Target exists (#{target}): [s]kip, [S]kip all, [b]ackup, [B]ackup all, [o]verwrite, [O]verwrite all"
        case STDIN.gets.chomp
        when 's' then next
        when 'S' then skip_all = true
        when 'b' then backup = true
        when 'B' then backup_all = true
        when 'o' then overwrite = true
        when 'O' then overwrite_all = true
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

task :default => 'install'

