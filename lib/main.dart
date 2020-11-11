import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kyc/core/auth/bloc/auth_bloc.dart';

import 'style/theme.dart';
import 'ui/auth/kyc_signin_page.dart';
import 'ui/auth/kyc_signup_page.dart';
import 'ui/home/kyc_home_page.dart';
import 'ui/shared/feedback.dart';
import 'ui/widget/loading_scaffold.dart';
import 'utils/kyc_layout_builder.dart';
import 'utils/system_chrome_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await SystemChromeService.setOrientationToLandScape();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..onAppLaunch(),
      child: MaterialApp(
        title: 'KYC App',
        theme: appTheme,
        home: BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
          if (state is AuthenticationFailed) {
            showFeedback(context, state?.error?.errorDescription ?? "");
          }
        }, builder: (context, state) {
          if (state is Undetermined) {
            return LoadingScaffold();
          } else if (state is Authenticated) {
            return KycHomePage();
          } else if (state is UnAuthenticatedSignIn) {
            return KycLayoutBuilderHelper(tabletView: KycSignInPage());
          } else {
            return KycLayoutBuilderHelper(tabletView: KycSignUpPage());
          }
        }),
      ),
    );
  }
}
