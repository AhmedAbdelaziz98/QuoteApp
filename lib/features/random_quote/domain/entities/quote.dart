import 'package:equatable/equatable.dart';

class Quote extends Equatable {

  final String author ;
  final String quote;
  final String category ;

  const Quote({required this.author, required this.quote, required this.category}); 
  @override
  List<Object?> get props => [author , quote , category];
}
