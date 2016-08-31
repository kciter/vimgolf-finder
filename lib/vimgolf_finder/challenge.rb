module VimGolfFinder
  class Challenge
    attr_accessor :id, :title, :entries
    attr_accessor :description
    attr_accessor :start_file, :end_file, :view_diff

    def print(index = 1)
      if self.solved?
        VimGolfFinder.ui.log "#{index}. \e[37m#{self.title}\e[0m - #{self.entries} entries (\e[33m#{self.id}\e[0m) [\u2713]"
      else
        VimGolfFinder.ui.log "#{index}. \e[37m#{self.title}\e[0m - #{self.entries} entries (\e[33m#{self.id}\e[0m)"
      end

    end

    def print_detail
      VimGolfFinder.ui.say "#{self.title}", :white
      self.description.scan(/.{1,70}/).each do |string|
        VimGolfFinder.ui.log "#{string}\n"
      end

      VimGolfFinder.ui.log '-' * 50
      VimGolfFinder.ui.info 'Start File'
      VimGolfFinder.ui.log "#{self.start_file}"
      VimGolfFinder.ui.log '-' * 50
      VimGolfFinder.ui.info 'End File'
      VimGolfFinder.ui.log "#{self.end_file}"
      VimGolfFinder.ui.log '-' * 50
    end

    def solved?
      path = "#{Dir.home}/.vimgolf_solves"
      unless File.exist?(path)
        file = File.new(path, File::CREAT|File::TRUNC|File::RDWR, 0644)
      else
        file = File.new(path)
      end

      file.readlines.each do |line|
        if line.eql?(self.id)
          return true
        end
      end

      return false
    end

    def self.solve(id)
      path = "#{Dir.home}/.vimgolf_solves"
      unless File.exist?(path)
        File.new(path, File::CREAT|File::TRUNC|File::RDWR, 0644)
      end

      File.open(path, 'a') { |file| file.write(id) }
    end
  end
end