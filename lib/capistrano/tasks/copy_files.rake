namespace :deploy do
  task :copy_files do
    next unless any? :copy_files
    on roles :app do
      next unless current_path
      fetch(:copy_files).each do |path|
        source = current_path.join(path)
        target = release_path.join(path)

        if test "[ -f #{source} ]"
          execute :cp, fetch(:copy_file_flags), source, target
        elsif test "[ -d #{source} ]"
          execute :cp, fetch(:copy_dir_flags), source, target
        else
          warn "#{source} is not a file/dir that can be copied (target: #{target})"
        end
      end
    end
  end

  task :updating do
    invoke "deploy:copy_files"
  end
end

namespace :load do
  task :defaults do
    set :copy_files, []
    set :copy_file_flags, ""
    set :copy_dir_flags, "-R"
  end
end
