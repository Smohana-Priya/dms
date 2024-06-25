import 'package:dms_dealers/screens/profile/profile.dart';
import 'package:dms_dealers/utils/color_resources.dart';
import 'package:dms_dealers/widgets/main_menu_card.dart';
import 'package:flutter/material.dart';
import '../../utils/contants.dart';
import '../../utils/image_resources.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Details',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: ColorResource.black1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Card(
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: MainMenuCard(
                    img: ImageResource.profile,
                    title: Constants.name,
                    subTitle: Constants.mobileNo,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              infoCard(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

infoCard() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Personal Information',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: ColorResource.lightGrey2,
          ),
          const SizedBox(
            height: 8,
          ),
          buildDetails('Name', 'Arun', 'Mobile No.', '987654321', 'Last', 'Ram',
              'Email ID', 'arunr@gmail.com'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Billing Address',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: ColorResource.lightGrey2,
          ),
          const SizedBox(
            height: 8,
          ),
          buildDetails('Country/Region', 'India', 'City.', 'Thiruvannamalai',
              'State', 'Tamil Nadu', 'Pin code', '638123'),
          const SizedBox(
            height: 10,
          ),
          buildDetailText(
              'Address', '4140 Parker Rd. Allentown, New Mexico 31134'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Document',
            style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: ColorResource.lightGrey2,
          ),
          const SizedBox(
            height: 8,
          ),
          buildDocumentRow(
            label: 'Aadhaar No',
            value: '8927 8362 8463 2383',
            onViewTap: () {
              // Handle View tap
            },
          ),
          const SizedBox(
            height: 5,
          ),
          buildDocumentRow(
            label: 'Pan No',
            value: 'ND629HS',
            onViewTap: () {
              // Handle View tap
            },
          ),
          const SizedBox(
            height: 5,
          ),
          buildDocumentRow(
            label: 'Licence',
            value: 'TN25-83976306730',
            onViewTap: () {
              // Handle View tap
            },
          ),
        ],
      ),
    ),
  );
}

Widget buildDocumentRow(
    {required String label,
    required String value,
    required VoidCallback onViewTap}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      children: [
        const Icon(
          Icons.file_copy_outlined,
          color: Colors.black,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                    color: ColorResource.lightGrey3,
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                    color: ColorResource.black1,
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onViewTap,
          child: const Text(
            'View',
            style: TextStyle(
                color: ColorResource.blue,
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  );
}
