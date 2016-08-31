module VimGolfFinder
  class << self
    attr_accessor :ui
    attr_accessor :parser

    def ui
      @ui ||= VimGolfFinder::CLI::UI.new
    end

    def parser
      @parser ||= VimGolfFinder::Parser.new
    end
  end

  class CLI < Thor
    include Thor::Actions

    def self.start(*)
      Thor::Base.shell = VimGolfFinder::CLI::UI
      super
    end

    desc 'list', 'Show VimGolf challenges'
    long_desc <<-LONGDESC
      Show VimGolf challenges from 'http://vimgolf.com/'.
    LONGDESC
    option :order, :default => 'entries', :aliases => :o, :type => :string
    option :desc, :default => true, :aliases => :d, :type => :boolean
    option :limit, :default => 10, :aliases => :l
    option :page, :default => 1, :aliases => :p
    def list
      order = options[:order]
      desc = options[:desc]
      limit = options[:limit].to_i
      page = options[:page].to_i

      challenges = VimGolfFinder.parser.fetch_challenges

      case order
        when 'title'
          challenges.sort! { |a, b| b.title <=> a.title } if desc
          challenges.sort! { |a, b| a.title <=> b.title } if !desc
        when 'entries'
          challenges.sort! { |a, b| b.entries <=> a.entries } if desc
          challenges.sort! { |a, b| a.entries <=> b.entries } if !desc
        when 'id'
          challenges.sort! { |a, b| b.id <=> a.id } if desc
          challenges.sort! { |a, b| a.id <=> b.id } if !desc
      end
      challenges = challenges[(limit * (page-1))...(limit * page)]
      challenges.each_with_index do |challenge, index|
        challenge.print(index+1)
      end

      number = VimGolfFinder.ui.ask 'Choose challenge number.'
      number = number.to_i
      if number.instance_of? Fixnum
        if number < 1 or number > limit
          VimGolfFinder.ui.error 'Invalid number'
          return
        end

        id = challenges[number-1].id
        print_challenge(id)
        play(id)
      end
    end

    desc 'random', 'Pick one at random from VimGolf challenges'
    def random
      challenges = VimGolfFinder.parser.fetch_challenges
      challenge = challenges.shuffle.first
      challenge.print

      id = challenge.id
      print_challenge(id)
      play(id)
    end

    private
    def print_challenge(id)
      VimGolfFinder.ui.log ''

      result = VimGolfFinder.ui.ask 'Open your web browser? (y/n)'
      if result.eql?('y') || result.eql?('yes')
        Launchy.open("http://vimgolf.com/challenges/#{id}")
      else
        VimGolfFinder.ui.warn 'Waiting...'
        challenge = VimGolfFinder.parser.get_challenge(id)
        challenge.print_detail
      end
    end

    def play(id)
      result = VimGolfFinder.ui.ask 'Do you want to play? (y/n)'

      if result.eql?('y') || result.eql?('yes')
        system("vimgolf put #{id}")

        solves = VimGolfFinder.ui.ask 'Solves? (y/n)'

        if solves.eql?('y') || solves.eql?('yes')
          VimGolfFinder::Challenge.solve(id)
          VimGolfFinder.ui.info "[\u2713] Checked!"
        end
      end
    end
  end
end
