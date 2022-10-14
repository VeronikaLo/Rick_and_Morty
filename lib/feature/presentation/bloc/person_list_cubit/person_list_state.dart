// 4 states:
// PersonEmpty = start
// PersonLoading = in loading process
// PersonLoaded = loading is finished
// PersonError = error by loading

import 'package:equatable/equatable.dart';
import '../../../domain/entities/person_entity.dart';

abstract class PersonState extends Equatable{
  const PersonState();

  @override
  List<Object> get props => [];
}


//1.
class PersonEmpty extends PersonState{
  @override
  List<Object> get props => [];
}

//2.
class PersonLoading extends PersonState {
  final List<PersonEntity> oldPersonsList;
  final bool isFirstFetch;  // to check is the list from the LocSt. has been loaded

  const PersonLoading(this.oldPersonsList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldPersonsList];
}

//3.
class PersonLoaded extends PersonState {
  final List<PersonEntity> personsList;

  const PersonLoaded(this.personsList);

  @override
  List<Object> get props => [personsList];
}

//4.
class PersonError extends PersonState {
  final String message;

  const PersonError({required this.message});

  @override
  List<Object> get props => [message];
}