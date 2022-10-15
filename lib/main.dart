import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randm/service_locator.dart' as di;

import 'feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'service_locator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized;
  di.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListCubit>(
          create: (context)=> sl<PersonListCubit>()),
        BlocProvider<PersonSearchBloc>(
          create: (context)=> sl<PersonSearchBloc>()),  
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false ,
        theme: ThemeData.dark().copyWith(
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: Colors.grey,
        ),
        home: const HomePage(),
      ),
    );
  }
}
