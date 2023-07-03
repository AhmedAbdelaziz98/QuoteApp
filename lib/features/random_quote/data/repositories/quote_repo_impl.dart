// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:quote/core/error/exceptions.dart';

import 'package:quote/core/error/failures.dart';
import 'package:quote/features/random_quote/data/datasources/random_quote_local_datasource.dart';
import 'package:quote/features/random_quote/data/datasources/random_quote_remote_datasoruce.dart';
import 'package:quote/features/random_quote/domain/entities/quote.dart';
import 'package:quote/features/random_quote/domain/repositories/quote_repo.dart';

import '../../../../core/network/network_info.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;
  final RemoteQuoteDataSource remoteQuoteDataSource;
  QuoteRepositoryImpl({
    required this.networkInfo,
    required this.randomQuoteLocalDataSource,
    required this.remoteQuoteDataSource,
  });
  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote = await remoteQuoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(remoteRandomQuote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(cacheRandomQuote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
