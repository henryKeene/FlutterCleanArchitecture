import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:login_signup/src/domain/di/di_init.dart';
import 'package:login_signup/src/presentation/blocs/auth_cubit/auth_cubit.dart';
import 'package:login_signup/src/presentation/flow/authentication_flow_state.dart';
import 'package:login_signup/src/presentation/views/pages/login_page.dart';
import 'package:login_signup/src/presentation/views/pages/sign_up_page.dart';

class AuthenticationFlow extends StatefulWidget {
  const AuthenticationFlow({super.key});

  @override
  State<AuthenticationFlow> createState() => _AuthenticationFlowState();
}

class _AuthenticationFlowState extends State<AuthenticationFlow> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  void dispose() {
    deinitialize();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => GetIt.I<AuthCubit>(),
      child: FlowBuilder<AuthenticationFlowState>(
        state: LoginState(),
        onGeneratePages: (state, pages) {
          return [
            const NoTransitionPage(child: LoginPage()),
            if (state is SignUpState)
              const NoTransitionPage(
                child: SignUpPage(),
              ),
          ];
        },
      ),
    );
  }
}
