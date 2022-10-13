import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:randm/core/usecases/usecase.dart';
import 'package:randm/feature/domain/repository/person_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/person_entity.dart';

class SearchPersons extends UseCase<List<PersonEntity>, SearchPersonParams>{

  final PersonRepository personRepository;

  SearchPersons(this.personRepository);

  Future<Either< Failure, List<PersonEntity>>> call(SearchPersonParams params) async{
    return await personRepository.searchPerson(params.query);
  }
}

class SearchPersonParams extends Equatable{

  final String query;
  const SearchPersonParams({required this.query}); 

  @override
  
  List<Object?> get props => [query];

}