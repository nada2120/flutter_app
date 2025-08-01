part of 'search_cubit.dart';

@immutable
 class SearchState extends Equatable{
  final List<Product> results;

 const SearchState(this.results);

  @override
  List<Object?> get props => [results];
}

