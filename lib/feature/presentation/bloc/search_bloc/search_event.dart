// only 1 event - when user presses the button search

import 'package:equatable/equatable.dart';
import 'package:randm/feature/presentation/bloc/search_bloc/search_state.dart';

abstract class PersonSearchEvent extends Equatable{
  const PersonSearchEvent();

  @override
  List<Object> get props => [];
}


class SearchPersons extends PersonSearchEvent{
  final String personQuery;

  const SearchPersons(this.personQuery);

}