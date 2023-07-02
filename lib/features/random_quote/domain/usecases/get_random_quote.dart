// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:quote/features/random_quote/domain/entities/quote.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/quote_repo.dart';

class GetRandomQuote implements UseCase<Quote,NoParams> {
final QuoteRepository quoteRepository;
  GetRandomQuote({
    required this.quoteRepository,
  });
  
  @override
  Future<Either<Failure, Quote>> call(NoParams params) {
    
    return quoteRepository.getRandomQuote();
  }
}
