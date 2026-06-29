import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/data/model/home/project_response.dart';

import '../../../../data/model/product/single_property_model.dart';
import '../../../../data/model/product/project_response.dart' as project;
import '../../../repository/home_repository.dart';


part 'property_details_state.dart';

class PropertyDetailsCubit extends Cubit<PropertyDetailsState> {
  final HomeRepository _homeRepository;
  PropertyDetailsCubit(HomeRepository homeRepository)
      : _homeRepository = homeRepository,
        super(PropertyDetailsInitial());

  SinglePropertyModel? singleProperty;
  project.ProjectResponse? singleProject;

  Future<void> fetchPropertyDetails(String slug) async {
    emit(PropertyDetailsLoading());

    final result = await _homeRepository.getSingleProperty(slug);
    result.fold(
      (failuer) {
        emit(PropertyDetailsError(failuer.message, failuer.statusCode));
      },
      (data) {
        singleProperty = data;
        emit(PropertyDetailsLoaded(data));
      },
    );
  }Future<void> fetchProjectDetails(String slug) async {
    emit(PropertyDetailsLoading());

    final result = await _homeRepository.getSingleProject(slug);
    result.fold(
      (failuer) {
        emit(PropertyDetailsError(failuer.message, failuer.statusCode));
      },
      (data) {
        singleProject = data;
        emit(ProjectDetailsLoaded(data));
      },
    );
  }
}
