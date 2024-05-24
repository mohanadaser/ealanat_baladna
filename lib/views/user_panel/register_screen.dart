// // ignore_for_file: must_be_immutable

// import 'package:ealanat_baladna/controller/registercontroller.dart';
// import 'package:ealanat_baladna/widgets/components.dart';
// import 'package:ealanat_baladna/widgets/otp_txt.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class RegisterScreen extends StatelessWidget {
//   const RegisterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(RegisterController());
//     return GetBuilder<RegisterController>(builder: (RegisterController ctrl) {
//       return Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(),
//           body: Directionality(
//             textDirection: TextDirection.rtl,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: ctrl.formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       "تسجيل حساب جديد",
//                       style: TextStyle(
//                           color: Colors.deepPurple,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25),
//                     ),
//                     SizedBox(
//                       width: Get.width * .9,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CustomForm(
//                             text: " الاسم ...",
//                             type: TextInputType.name,
//                             name: ctrl.username,
//                             sufxicon: const Icon(Icons.person)),
//                       ),
//                     ),
//                     SizedBox(height: Get.height / 18),
//                     SizedBox(
//                       width: Get.width * .9,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CustomForm(
//                             // validator: (val) {
//                             //   if ( val==null) {
//                             //     return "يجب ادخال رقم التليفون";
//                             //   }
//                             //   return null;
//                             // },
//                             text: "رقم الهاتف",
//                             formating: [LengthLimitingTextInputFormatter(11)],
//                             type: TextInputType.phone,
//                             name: ctrl.phonenum,
//                             sufxicon: const Icon(Icons.phone_android)),
//                       ),
//                     ),
//                     SizedBox(height: Get.height / 30),
//                     OtpText(
//                       otpController: ctrl.otpController,
//                       isshow: ctrl.otpisshow,
//                       onComplete: (otp) {
//                         ctrl.otpentered = int.parse(otp);
//                       },
//                     ),
//                     SizedBox(height: Get.height / 30),
//                     ElevatedButton(
//                       style: const ButtonStyle(
//                           backgroundColor:
//                               MaterialStatePropertyAll<Color>(Colors.black)),
//                       onPressed: () {
//                         if (ctrl.otpisshow) {
//                           ctrl.addUser();
//                         } else {
//                           ctrl.sendOtp();
//                         }
//                       },
//                       child: Text(
//                         ctrl.otpisshow ? "  تسجيل الحساب" : "ارسال ال otp ",
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 3,
//                     ),
//                     TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           "الدخول",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ))
//                   ],
//                 ),
//               ),
//             ),
//           ));
//     });
//   }
// }
