// import 'package:ealanat_baladna/controller/auth_login.dart';
// import 'package:ealanat_baladna/views/user_panel/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:telephony/telephony.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   bool isloading = false;
//   final Telephony telephony = Telephony.instance;

//   final TextEditingController _phoneContoller = TextEditingController();
//   final TextEditingController _otpContoller = TextEditingController();

//   final _formKey = GlobalKey<FormState>();
//   final _formKey1 = GlobalKey<FormState>();

//   void listenToIncomingSMS(BuildContext context) {
//     print("Listening to sms.");
//     telephony.listenIncomingSms(
//         onNewMessage: (SmsMessage message) {
//           // Handle message
//           print("sms received : ${message.body}");
//           // verify if we are reading the correct sms or not

//           if (message.body!.contains("phone-auth-15bdb")) {
//             String otpCode = message.body!.substring(0, 6);
//             setState(() {
//               _otpContoller.text = otpCode;
//               // wait for 1 sec and then press handle submit
//               Future.delayed(const Duration(seconds: 1), () {
//                 handleSubmit(context);
//               });
//             });
//           }
//         },
//         listenInBackground: false);
//   }

// // handle after otp is submitted
//   void handleSubmit(BuildContext context) {
//     if (_formKey1.currentState!.validate()) {
//       AuthService.loginWithOtp(otp: _otpContoller.text).then((value) {
//         if (value == "Success") {
//           Navigator.pop(context);
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) => const HomeScreen()));
//         } else {
//           Navigator.pop(context);
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text(
//               value,
//               style: const TextStyle(color: Colors.white),
//             ),
//             backgroundColor: Colors.red,
//           ));
//         }
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     listenToIncomingSMS(context);
//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Directionality(
//             textDirection: TextDirection.ltr,
//             child: SingleChildScrollView(
//               child: SizedBox(
//                 height: MediaQuery.of(context).size.height,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       color: Colors.lightBlue,
//                       width: Get.width,
//                       child: Lottie.asset("assets/animations/login.json.json"),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     // padding: const EdgeInsets.all(12.0),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "مرحبا بك 👋",
//                           style: TextStyle(
//                               fontSize: 32, fontWeight: FontWeight.w700),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Form(
//                           key: _formKey,
//                           child: TextFormField(
//                             inputFormatters: [
//                               LengthLimitingTextInputFormatter(11)
//                             ],
//                             controller: _phoneContoller,
//                             keyboardType: TextInputType.phone,
//                             decoration: InputDecoration(
//                                 prefixText: "+2 ",
//                                 labelText: "ادخل رقم تليفونك",
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(32))),
//                             validator: (value) {
//                               if (value!.length != 11) {
//                                 return "رقم تليفون غير صالح";
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         SizedBox(
//                           height: 50,
//                           width: double.infinity,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 isloading = true;
//                               });
//                               if (_formKey.currentState!.validate()) {
//                                 AuthService.sentOtp(
//                                     phone: _phoneContoller.text,
//                                     errorStep: () =>
//                                         ScaffoldMessenger.of(context)
//                                             .showSnackBar(const SnackBar(
//                                           content: Text(
//                                             "خطأ فى ارسال رمز ال otp",
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                           ),
//                                           backgroundColor: Colors.red,
//                                         )),
//                                     nextStep: () {
//                                       setState(() {
//                                         isloading = false;
//                                       });
//                                       // start lisenting for otp
//                                       listenToIncomingSMS(context);
//                                       showDialog(
//                                           context: context,
//                                           builder: (context) => AlertDialog(
//                                                 title: const Text(
//                                                     "OTP Verification"),
//                                                 content: Column(
//                                                   mainAxisSize:
//                                                       MainAxisSize.min,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     const Text(
//                                                         "Enter 6 digit OTP"),
//                                                     const SizedBox(
//                                                       height: 12,
//                                                     ),
//                                                     Form(
//                                                       key: _formKey1,
//                                                       child: TextFormField(
//                                                         keyboardType:
//                                                             TextInputType
//                                                                 .number,
//                                                         controller:
//                                                             _otpContoller,
//                                                         decoration: InputDecoration(
//                                                             labelText:
//                                                                 "ادخل الكود المرسل ",
//                                                             border: OutlineInputBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             32))),
//                                                         validator: (value) {
//                                                           if (value!.length !=
//                                                               6) {
//                                                             return "الرمز غير صحيح حاول مره اخرى";
//                                                           }

//                                                           return null;
//                                                         },
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 actions: [
//                                                   TextButton(
//                                                       onPressed: () =>
//                                                           handleSubmit(context),
//                                                       child: const Text(
//                                                         "Submit",
//                                                         style: TextStyle(
//                                                             fontSize: 18,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .bold),
//                                                       ))
//                                                 ],
//                                               ));
//                                     });
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.yellow,
//                                 foregroundColor: Colors.black),
//                             child: isloading
//                                 ? const CircularProgressIndicator()
//                                 : const Text(
//                                     "send otp",
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             )));
//   }
// }
