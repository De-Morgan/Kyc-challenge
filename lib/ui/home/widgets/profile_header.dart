import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kyc/core/auth/bloc/auth_bloc.dart';
import 'package:flutter_kyc/core/auth/models/user.dart';
import 'package:flutter_kyc/style/color.dart';

import 'klv_level_builder.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User user = (context.watch<AuthCubit>().state as Authenticated).user;
    return Container(
      color: whiteColor,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 100,
                color: backgroundGreyColor,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${user.username}"),
                  const SizedBox(height: 10),
                  Text("${user.name}"),
                  const SizedBox(height: 10),
                  Text("${user.email}"),
                ],
              ),
            ],
          ),
          const SizedBox(width: 36),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Spacer(),
              KlvLevelBuilder()
            ],
          ),
          const SizedBox(width: 36),
          FlatButton(
              onPressed: () {},
              child: Text("Upgrade to level ${user.kycLevel + 1}"))
        ],
      ),
    );
  }
}
