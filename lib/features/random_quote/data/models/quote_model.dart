import '../../domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel({
    required super.author,
    required super.quote,
    required super.category,
  });

   factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        quote: json["quote"],
        author: json["author"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "quote": quote,
        "author": author,
        "category": category,
    };
}
