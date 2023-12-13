import 'package:bloc_network_example/bloc/user_bloc.dart';
import 'package:bloc_network_example/bloc/user_event.dart';
import 'package:bloc_network_example/services/user_repository.dart';
import 'package:bloc_network_example/widgets/action_buttons.dart';
import 'package:bloc_network_example/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  // final userRepository = UserRepository();
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(),
      child: BlocProvider(
        create: (context) =>
            UserBloc(userRepository: context.read<UserRepository>())
              ..add(UserLoadEvent()),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'User List',
            ),
          ),
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ActionButtons(),
              UserList(),
            ],
          ),
        ),
      ),
    );
  }
}
