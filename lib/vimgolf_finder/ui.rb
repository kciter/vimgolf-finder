module VimGolfFinder
  class CLI < Thor
    class UI < Thor::Base.shell
      def initialize
        super
      end

      def error(message)
        say message, :red
      end

      def info(message)
        say message, :green
      end

      def warn(message)
        say message, :yellow
      end

      def log(message)
        say message
      end

      def debug(message)
        say message, :cyan
      end
    end
  end
end
