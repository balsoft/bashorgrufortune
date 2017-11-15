require 'rss/2.0'
require 'cgi'
require 'net/http'
host = Net::HTTP.new('bash.org.ru', 80)
resp, data = host.get('<a href="http://bash.org.ru/rss/'">http://bash.org.ru/rss/'</a>, nil)
parsed = RSS::Parser.parse(data.gsub(/\< hr\>/, '< hr />'), false)
parsed.items.each { |x| puts CGI::unescapeHTML(x.description.gsub("\n", "").gsub("< br>", "\n")); puts "%\n" }
