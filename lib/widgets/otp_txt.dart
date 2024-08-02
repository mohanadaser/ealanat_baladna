// // ignore_for_file: avoid_unnecessary_containers

// import 'package:flutter/material.dart';
// import 'package:otp_text_field_v2/otp_field_v2.dart';

// class OtpText extends StatelessWidget {
//   final OtpFieldControllerV2 otpController = OtpFieldControllerV2();
//   final bool isshow;
//   final Function(String) onComplete;

//   OtpText(
//       {super.key,
//       required TextEditingController otpController,
//       required this.isshow,
//       required this.onComplete});

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//         textDirection: TextDirection.ltr,
//         child: Container(
//           child: Visibility(
//             visible: isshow,
//             child: OTPTextFieldV2(
//                 controller: otpController,
//                 length: 4,
//                 autoFocus: true,
//                 width: MediaQuery.of(context).size.width,
//                 textFieldAlignment: MainAxisAlignment.spaceAround,
//                 fieldWidth: 45,
//                 fieldStyle: FieldStyle.box,
//                 outlineBorderRadius: 15,
//                 style: const TextStyle(
//                   fontSize: 17,
//                 ),
//                 onChanged: (pin) {
//                   print("Changed: \$pin");
//                 },
//                 onCompleted: (pin) {
//                   onComplete(pin);
//                 }),
//           ),
//         ));
//   }
// }
