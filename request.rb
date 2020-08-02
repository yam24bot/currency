require 'rest-client'
require 'json'

class Request
  def get_json
    url = 'http://data.fixer.io/api/latest?access_key=72fa8b1e112d66b76da98b8b525eb147'
    response = RestClient.get(url)
    @json = JSON.parse(response)
  end
end
