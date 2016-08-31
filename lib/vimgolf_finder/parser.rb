module VimGolfFinder
  class Parser
    BASE_URL = 'http://vimgolf.com'

    def fetch_challenges
      challenges = []

      doc = Nokogiri::HTML(open(BASE_URL))
      doc.css('.grid_7 > div').each do |div|
        challengeDOM = div.at_css('h5.challenge')
        aTAG = challengeDOM.at_css('a')
        challenge = VimGolfFinder::Challenge.new
        challenge.id = aTAG['href'][12..-1]
        challenge.title = aTAG.content
        challenge.entries = challengeDOM.content.match(/- (\d*) entries/).captures.first.to_i
        challenges << challenge
      end

      challenges
    end

    def get_challenge(id)
      challenge = VimGolfFinder::Challenge.new

      doc = Nokogiri::HTML(open("#{BASE_URL}/challenges/#{id}", 'Accept' => 'text/html'))

      doc.css('.grid_7:not(#about)').each do |dom|
        challenge.id = id
        challenge.title = dom.at_css('h3 b').content
        challenge.description = dom.at_css('p').content
        challenge.start_file = dom.at_css('.prettyprint').content
        challenge.end_file = dom.css('.prettyprint')[1].content
        challenge.view_diff = dom.at_css('pre.diff').content
      end

      challenge
    end
  end
end