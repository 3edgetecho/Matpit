part of 'property_details_cubit.dart';

abstract class PropertyDetailsState extends Equatable {
  const PropertyDetailsState();

  @override
  List<Object> get props => [];
}

class PropertyDetailsInitial extends PropertyDetailsState {}

class PropertyDetailsLoading extends PropertyDetailsState {}

class PropertyDetailsError extends PropertyDetailsState {
  final String error;
  final int code;
  const PropertyDetailsError(this.error, this.code);

  @override
  List<Object> get props => [error, code];
}

class PropertyDetailsLoaded extends PropertyDetailsState {
  final SinglePropertyModel singlePropertyModel;
  const PropertyDetailsLoaded(this.singlePropertyModel);

  @override
  List<Object> get props => [singlePropertyModel];
}

class ProjectDetailsLoaded extends PropertyDetailsState {
  final project.ProjectResponse projectResponse;
  const ProjectDetailsLoaded(this.projectResponse);

  @override
  List<Object> get props => [projectResponse];
}
