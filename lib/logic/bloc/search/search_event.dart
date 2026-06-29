part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchPaginationLoading extends SearchState {}
class SearchEventProperty extends SearchEvent {
  final String name;
  final int page;
  final bool isPagination;

  const SearchEventProperty({
    required this.name,
    this.page = 1,
    this.isPagination = false,
  });

  @override
  List<Object?> get props => [name, page, isPagination];
}


class SearchEventLoadMoreProperty extends SearchEvent {
  const SearchEventLoadMoreProperty();
}
