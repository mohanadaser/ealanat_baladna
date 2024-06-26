import 'package:ealanat_baladna/widgets/banner_screen.dart';
import 'package:flutter/material.dart';

class MostLiked extends StatelessWidget {
  const MostLiked({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [BannerScreen()],
        ),
      ),
    );
  }
}
