import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kyc/core/auth/bloc/auth_bloc.dart';
import 'package:flutter_kyc/core/auth/models/user.dart';
import 'package:flutter_kyc/core/mixin/input_validator_mixin.dart';
import 'package:flutter_kyc/ui/shared/feedback.dart';

import '../widget/hackathon_widget.dart';
import '../widget/kyc_textfield.dart';
import '../widget/loading_button.dart';

class KycSignUpPage extends StatelessWidget with InputValidator {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 4 / 5,
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 50),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 40, 30, 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HacathonWidget(),
                      Spacer(),
                      Text("Create your hackathon account"),
                      Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: KycTextField(
                              label: "Email Address",
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
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: KycTextField(
                              label: "Name",
                              textFormField: TextFormField(
                                controller: _name,
                                keyboardType: TextInputType.text,
                                validator: (name) => isNameValid(name)
                                    ? null
                                    : "Enter valid name",
                                onSaved: (name) {
                                  _name.text = name;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      KycTextField(
                        label: "Username",
                        textFormField: TextFormField(
                          controller: _username,
                          keyboardType: TextInputType.text,
                          validator: (username) =>
                              isNameValid(username) ? null : "Enter valid name",
                          onSaved: (username) {
                            _username.text = username;
                          },
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: KycTextField(
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
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: KycTextField(
                              label: "Confirm Password",
                              textFormField: TextFormField(
                                controller: _confirmPassword,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                validator: (password) {
                                  if (password != _password.text) {
                                    return "Password mismatch";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                  "Use 8 or more character with a mix of letters, numbers & symbols")),
                          Spacer()
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlatButton(
                              onPressed: () =>
                                  context.read<AuthCubit>().navigateToSignIn(),
                              child: Text("Sign in instead?")),
                          KycRaisedButton(
                            loadingStream:
                                context.watch<AuthCubit>().authLoading,
                            label: "Sign up",
                            width: 200,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                final user = User(
                                    username: _username.text,
                                    password: _password.text,
                                    name: _name.text,
                                    email: _email.text);
                                await context.read<AuthCubit>().signUp(user);
                                showFeedback(context,
                                    "Check your mail for verification message");
                                showFeedback(context, "Proceed with login");
                              }
                            },
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
      ),
    );
  }
}
