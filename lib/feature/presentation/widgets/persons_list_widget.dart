import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randm/feature/presentation/bloc/person_list_cubit/person_list_state.dart';

import '../../domain/entities/person_entity.dart';
import '../bloc/person_list_cubit/person_list_cubit.dart';

class PersonsList extends StatelessWidget {
  const PersonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<PersonListCubit, PersonState>(
      builder: (context, state) {
        List<PersonEntity> persons = [];

        if (state is PersonLoading && state.isFirstFetch) {
        return _loadingIndicator();
      } else if(state is PersonLoaded){
        persons = state.personsList;
      }

      return ListView.separated(
        itemBuilder: (context, index){
          return Text('${persons[index]}');
        }, 
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        }, 
        itemCount: persons.length);



      },
    );
  



}

Widget  _loadingIndicator(){
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: CircularProgressIndicator(), ),
    );
  }

}