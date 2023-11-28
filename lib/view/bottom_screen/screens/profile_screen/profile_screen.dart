import 'package:flutter/material.dart';
import 'package:my_news/utils/color_constant.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage(''),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Vyshnav k m',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.textblack),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
