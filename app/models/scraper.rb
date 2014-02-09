class Scraper

	def self.scrape
		data = 
		HTTParty.get('http://www.brainyquote.com/quotes/authors/d/dr_seuss.html')


		response_body =
			data.response.body

		doc = Nokogiri::HTML(
			response_body
			)
#catching all aspects of the doc that match with the thing inside quotes.
#going for .bqQuoteLink because thats the class to match
#going for a because that marks a link
#lets force it all into a quote
		quotes = []
		doc.css('.bqQuoteLink a').each do |link|
			#this next line will shove everything that matches into an array
			#now we want link.content because the content is what's inside of the link...its the quote itself!
			quotes << link.content
			
		end
		element = rand(quotes.count - 1)
quotes[element] #outputs the array of quotes
	end


end