import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kyc/core/auth/bloc/auth_bloc.dart';
import 'package:flutter_kyc/core/auth/models/user.dart';

class KlvLevelBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = (context.watch<AuthCubit>().state as Authenticated).user;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all()),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: Text("KYC LV ${user.kycLevel}"),
    );
  }
}
