import 'package:flutter/material.dart';
import 'package:flutter_kyc/ui/widget/kyc_textfield.dart';

class VerificationDialogChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Column(
        children: [
          KycTextField(
            label: "Bvn Number",
            textFormField: TextFormField(),
          ),
          const SizedBox(height: 12),
          KycTextField(
            label: "Date of Birth",
            textFormField: TextFormField(),
          ),
        ],
      ),
    );
  }
}
