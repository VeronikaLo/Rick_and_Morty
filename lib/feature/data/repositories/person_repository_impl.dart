import 'package:randm/feature/domain/entities/person_entity.dart';
import 'package:randm/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:randm/feature/domain/repository/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository{
  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page) {
    // TODO: implement getAllPersons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query) {
    // TODO: implement searchPerson
    throw UnimplementedError();
  }

}