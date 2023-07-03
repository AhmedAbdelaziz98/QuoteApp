import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quote/core/error/exceptions.dart';

import 'package:quote/features/random_quote/data/models/quote_model.dart';

abstract class RemoteQuoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RemoteQuoteDataSource {
  final String endPoint = 'https://api.api-ninjas.com/v1/quotes?';
  final http.Client client;
  RandomQuoteRemoteDataSourceImpl({
    required this.client,
  });
  @override
  Future<QuoteModel> getRandomQuote() async {
    final remoteQuoteUrl = Uri.parse(endPoint);
    final response = await client.get(remoteQuoteUrl, headers: {
      'Content-Type': 'application/json',
      'X-Api-Key': 'MOazYgpQHn5En2Nxf+/aEA==SWQa0nuTmbVLn8oV',
    });

    if (response.statusCode == 200) {
      return QuoteModel.fromJson(json.decode(response.body)[0]);
    } else {
      throw ServerException();
    }
  }
}
