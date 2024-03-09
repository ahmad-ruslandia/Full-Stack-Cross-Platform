import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullstack/providers/user_provider.dart';

class UserViewScreen extends ConsumerWidget {
  final Object? userObject;

  const UserViewScreen({super.key, required this.userObject});

  static const String routeName = "/user-view";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userId = int.parse(userObject.toString());

    final singleUser = ref.watch(singleUserProvider(userId));

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("USER"),
      ),
      body: SingleChildScrollView(
        child: singleUser.when(
          data: (user) {
            return Card(
              child: ListTile(
                title: Text(user.data!.fullName.toString()),
                subtitle: Text(user.data!.mobileNumber.toString()),
              ),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (err, stack) => Text('Error $err'),
        ),
      ),
    ));
  }
}
