import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fullstack/models/users.dart';
import 'package:fullstack/providers/user_provider.dart';

class UserFormScreen extends StatelessWidget {
  const UserFormScreen({super.key});

  static const String routeName = "/userform";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("USER FORM"),
      ),
      body: const Center(
        child: Column(children: [
          UserForm(),
        ]),
      ),
    ));
  }
}

class UserForm extends ConsumerStatefulWidget {
  const UserForm({super.key});

  @override
  AUserFormState createState() => AUserFormState();
}

class AUserFormState extends ConsumerState<UserForm> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLength: 30,
              controller: _fullNameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Full Name";
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Your Full Name",
                  labelText: "Full Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLength: 15,
              controller: _mobileNumberController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please Enter Mobile Number";
                }
                return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Your Mobile Number",
                  labelText: "Mobile Number"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  var user = User(
                      id: 0,
                      fullName: _fullNameController.text,
                      mobileNumber: _mobileNumberController.text);
                  var resp =
                      await ref.read(userFormProvider).onSubmitUser(user);

                  if (resp.status == true) {
                    _fullNameController.clear();
                    _mobileNumberController.clear();
                    _formKey.currentState!.reset();
                  }
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(resp.message.toString()),
                      duration: const Duration(seconds: 3),
                      backgroundColor:
                          (resp.status == true) ? Colors.green : Colors.red,
                    ),
                  );
                }
              },
              child: const Text("SUBMIT"),
            ),
          )
        ],
      ),
    );
  }
}
