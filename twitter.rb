require 'nokogiri'
require 'open-uri'


class TwitterScrapper
  def initialize#(url)
    url = ARGV
    html_file = open(url[0])
    @doc = Nokogiri::HTML(html_file )
  end

  def extract_username
    profile_name = @doc.search(".ProfileHeaderCard-name > a")
    puts profile_name
    puts "Username: #{profile_name.inner_text}"
  end

  def extract_tweets
    
    @tweets = @doc.search(".tweet")
    @tweets.pop
    puts "Tweets:\n"
    @tweets.each do |t| 
      date =  t.css("span._timestamp.js-short-timestamp").inner_text
      text =  t.css(".tweet-text").inner_text
      re_tweet = t.css(".ProfileTweet-actionCountForPresentation").first.inner_text
      favs = t.css(".ProfileTweet-actionCountForPresentation").last.inner_text
      puts "#{date}: #{text}"
      puts "Retweets: #{re_tweet}, Favorites: #{favs}"
      puts "\n"
    end
  end



  def extract_stats
    s = []
    stats = @doc.search(".ProfileNav-value")
    stats.each do |data|
      s << data.inner_text
    end
    puts "-"*72
    puts "Stats: Tweets: #{s[0]}, Siguiendo: #{s[1]}, Seguidores: #{s[2]}"
    puts "-"*72
  end

end

a  = TwitterScrapper.new
 a.extract_username
# a.extract_tweets
a.extract_stats
a.extract_tweets  