import 'package:flutter/material.dart';

class NavMenuCard extends StatelessWidget {
  final String img;
  final String title;
  const NavMenuCard({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(img),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: const TextStyle(
              fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
