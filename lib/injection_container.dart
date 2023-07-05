import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quote/core/api/api_consumer.dart';
import 'package:quote/core/api/app_interceptor.dart';
import 'package:quote/core/api/dio_consumer.dart';
import 'package:quote/core/network/network_info.dart';
import 'package:quote/features/random_quote/data/datasources/random_quote_local_datasource.dart';
import 'package:quote/features/random_quote/data/datasources/random_quote_remote_datasoruce.dart';
import 'package:quote/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/random_quote/data/repositories/quote_repo_impl.dart';
import 'features/random_quote/domain/repositories/quote_repo.dart';
import 'features/random_quote/domain/usecases/get_random_quote.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  //Blocs
  sl.registerFactory(() => RandomQuoteCubit(getRandomQuote: sl()));

  // UseCase

  sl.registerLazySingleton(() => GetRandomQuote(quoteRepository: sl()));

  // repo

  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImpl(
        networkInfo: sl(),
        randomQuoteLocalDataSource: sl(),
        remoteQuoteDataSource: sl(),
      ));

  // Data Sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RemoteQuoteDataSource>(
      () => RandomQuoteRemoteDataSourceImpl(apiConsumer: sl()));

  //! Core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true));
}
