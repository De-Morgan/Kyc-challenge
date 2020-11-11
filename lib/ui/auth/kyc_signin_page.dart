import 'package:flutter/material.dart';
import 'package:flutter_kyc/core/auth/bloc/auth_bloc.dart';
import 'package:flutter_kyc/core/mixin/input_validator_mixin.dart';
import 'package:flutter_kyc/style/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kyc/ui/widget/loading_button.dart';
import '../widget/hackathon_widget.dart';
import '../widget/kyc_textfield.dart';

class KycSignInPage extends StatelessWidget with InputValidator {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HacathonWidget(),
              Container(
                width: 500,
                child: AspectRatio(
                  aspectRatio: 0.8,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 50),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 40, 30, 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Welcome back",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(height: 20),
                            Text("Please sign in"),
                            Spacer(),
                            KycTextField(
                              label: "Email",
                              textFormField: TextFormField(
                                controller: _email,
                                keyboardType: TextInputType.emailAddress,
                                validator: (email) => isEmailValid(email)
                                    ? null
                                    : "Enter valid email address",
                                onSaved: (email) {
                                  _email.text = email;
                                },
                              ),
                            ),
                            Spacer(),
                            KycTextField(
                              label: "Password",
                              textFormField: TextFormField(
                                controller: _password,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                validator: (password) =>
                                    isPasswordValid(password)
                                        ? null
                                        : "Enter a strong password",
                                onSaved: (password) {
                                  _password.text = password;
                                },
                              ),
                            ),
                            Spacer(),
                            KycRaisedButton(
                              label: "Sign in",
                              width: double.infinity,
                              loadingStream:
                                  context.watch<AuthCubit>().authLoading,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  context
                                      .read<AuthCubit>()
                                      .signIn(_email.text, _password.text);
                                }
                              },
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlatButton(
                                    onPressed: () {},
                                    child: Text("Forget password?")),
                                InkWell(
                                  onTap: () => context
                                      .read<AuthCubit>()
                                      .navigateToSignUp(),
                                  child: RichText(
                                      text: TextSpan(
                                          text: "new User?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                          children: [
                                        TextSpan(
                                            text: ' Sign up',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(color: primaryColor))
                                      ])),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
