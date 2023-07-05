class EndPoints {
  static const String baseUrl = 'https://api.api-ninjas.com/';
  static const String randomQuote = '${baseUrl}v1/quotes';
}

class Headers {
  static const Map<String, String> quoteHeaders = {
    'Content-Type': 'application/json',
    'X-Api-Key': 'MOazYgpQHn5En2Nxf+/aEA==SWQa0nuTmbVLn8oV',
  };
}
