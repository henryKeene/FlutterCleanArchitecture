import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signup/src/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:login_signup/src/presentation/flow/authentication_flow_state.dart';
import 'package:starter_app/localizations/custom_localizations.dart';
import 'package:starter_app/localizations/message.i69n.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state.isLoading) return;

        return state.failure.isSome()
            ? await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Error'),
                  content: Text(
                    state.failure.fold(
                      () => '',
                      (failure) => 'Error occurred: $failure',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              )
            : null;
      },
      builder: (context, state) {
        final text = context.translations.login_signup;

        String? errorText;
        if (state.failure.isSome()) {
          state.failure.fold(() {}, (failure) {
            errorText = 'Error occurred: $failure';
          });
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(text.login),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: state.formKey,
              child: Column(
                children: [
                  TextFormField(
                    forceErrorText: errorText,
                    decoration: InputDecoration(labelText: text.email),
                    onChanged: (value) =>
                        context.read<AuthCubit>().emailChanged(value),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: text.password),
                    obscureText: true,
                    onChanged: (value) =>
                        context.read<AuthCubit>().passwordChanged(value),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().signInWithEmailAndPassword(
                            email: state.email,
                            password: state.password,
                          );
                    },
                    child: state.isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(8),
                            child: CircularProgressIndicator(),
                          )
                        : Text(text.login_button),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          context
                              .flow<AuthenticationFlowState>()
                              .update((state) => SignUpState());
                        },
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
