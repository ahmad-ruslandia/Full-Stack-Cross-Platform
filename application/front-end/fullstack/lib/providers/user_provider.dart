import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullstack/models/users.dart';
import 'package:fullstack/repositories/user_repository.dart';

final userRepositoryProvider =
    Provider<IUserRepository>((ref) => UserRepository());

final usersList = FutureProvider.autoDispose<UserListResponse>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return repository.fetchUsersList();
});

final singleUserProvider =
    FutureProvider.autoDispose.family<UserResponse, int>((ref, userId) {
  final repository = ref.watch(userRepositoryProvider);
  return repository.getUserById(userId);
});

class UserFormNotifier extends ChangeNotifier {
  UserFormNotifier(this.ref) : super();
  final Ref ref;

  Future<UserResponse> onSubmitUser(User user) async {
    final repository = ref.read(userRepositoryProvider);
    late UserResponse resp;

    if (user.id == 0) {
      resp = await repository.createNewUser(user);
    } else {}
    return resp;
  }
}

final userFormProvider =
    ChangeNotifierProvider.autoDispose<UserFormNotifier>((ref) {
  return UserFormNotifier(ref);
});
