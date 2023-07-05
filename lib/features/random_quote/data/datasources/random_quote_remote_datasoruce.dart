
import 'package:quote/core/api/api_consumer.dart';
import 'package:quote/core/api/end_points.dart';

import 'package:quote/features/random_quote/data/models/quote_model.dart';

abstract class RemoteQuoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImpl implements RemoteQuoteDataSource {
  final ApiConsumer apiConsumer;
  RandomQuoteRemoteDataSourceImpl({
    required this.apiConsumer,
  });
  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await apiConsumer.get(
      EndPoints.randomQuote,
      queryParameters: Headers.quoteHeaders,
    );
    print(response);
    return QuoteModel.fromJson(response[0]);
  }
}
