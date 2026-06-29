import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/data/data_provider/remote_url.dart';
import '/data/model/search_response_model/search_property_model.dart';
import '../../../data/model/search_response_model/search_response_model.dart';
import '../../repository/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;

  SearchOverviewModel? _searchResponseModel;


  SearchBloc({required SearchRepository searchRepository})
      : _searchRepository = searchRepository,
        super(SearchInitial()) {
    on<SearchEventProperty>(_searchProperty);
    on<SearchEventLoadMoreProperty>(_searchMoreProperty);
  }

  List<PropertyModel> allProperties = [];
  List<ProjectModel> allProjects = [];
  int currentPage = 1;
  bool hasMore = true;

  Future<void> _searchProperty(SearchEventProperty event, Emitter<SearchState> emit) async {
    if (event.isPagination && !hasMore) return;

    if (event.isPagination) {
      emit(SearchPaginationLoading());
    } else {
      currentPage = 1;
      allProperties.clear();
      allProjects.clear();
      emit(SearchLoading());
    }

    final uri = Uri.parse(RemoteUrls.getSearchProperty).replace(
      queryParameters: {
        'search': event.name,
        'page': event.page.toString(),
      },
    );

    print(uri);
    final result = await _searchRepository.getSearchProperty(uri);

    print(result);
    result.fold(
          (failure) => emit(SearchError(failure.message, failure.statusCode)),
          (success) {
        final newProjects = success.projects?.data ?? [];
        final newProperties = success.properties?.data ?? [];

        if (event.isPagination) {
          allProjects.addAll(newProjects);
          allProperties.addAll(newProperties);
        } else {
          allProjects = newProjects;
          allProperties = newProperties;
        }

        // ✅ Null-safe access to currentPage
        currentPage = success.projects?.currentPage ?? 1;

        // ✅ Null-safe check for hasMore
        hasMore = (success.projects?.nextPageUrl != null) || (success.properties?.nextPageUrl != null);

        print("Properties${allProperties.length}");


        emit(SearchLoaded(
          properties: allProperties,
          projects: allProjects,
          currentPage: currentPage,
          hasMore: hasMore,
        ));
      },
    );
  }



  bool isLoading = false;





  Future<void> _searchMoreProperty(
      SearchEventLoadMoreProperty event, Emitter<SearchState> emit) async {
    if (state is SearchMorePropertyLoading) return;
    if (_searchResponseModel == null) {
      return;
    }
    emit(SearchMorePropertyLoading());
    final uri = Uri.parse("_searchResponseModel!.nextPageUrl");
    final result = await _searchRepository.getSearchProperty(uri);

    result.fold((failure) {
      emit(SearchMorePropertyError(failure.message, failure.statusCode));
    }, (success) {
      _searchResponseModel = success;
    //  property.addAll(success.data!);
     // emit(SearchMorePropertyLoaded(property.toSet().toList()));
    });
  }
}
