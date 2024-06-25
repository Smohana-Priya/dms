import 'package:dms_dealers/screens/about_vehicle/about_vahicle.dart';
import 'package:dms_dealers/utils/color_resources.dart';
import 'package:dms_dealers/widgets/logout_sheet.dart';
import 'package:dms_dealers/widgets/main_menu_card.dart';

import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import '../../utils/image_resources.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final List<Map<String, dynamic>> items = [
    {'icon': ImageResource.vehicle3, 'title': '02', 'subtitle': 'Vehicle'},
    {'icon': ImageResource.spare2, 'title': '05', 'subtitle': 'Spare'},
    {'icon': ImageResource.acc, 'title': '__', 'subtitle': 'Accessory'},
    {'icon': ImageResource.acc, 'title': '__', 'subtitle': 'Accessory'},
  ];
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    void handleMobileBack() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AboutVahicle()));
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        handleMobileBack();
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MainMenuCard(
                    img: ImageResource.profile,
                    title: Constants.name,
                    subTitle: Constants.mobileNo,
                    isProfile: true,
                  ),
                  const Divider(
                    color: ColorResource.lightGrey2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: 16,
                    spacing: 16,
                    children: [
                      for (int i = 0; i < items.length; i++)
                        Container(
                          width: MediaQuery.of(context).size.width / 2.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border:
                                  Border.all(color: ColorResource.lightGrey2)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Image.asset(items[i]['icon']),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        items[i]['title'],
                                        style: const TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        items[i]['subtitle'],
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ])
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  dealerDetails(),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorResource.lightGrey),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'My Vehicle',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Switch(
                            value: _isSwitched,
                            onChanged: (value) {
                              setState(() {
                                _isSwitched = value;
                              });
                            },
                            activeColor: Colors.white,
                            inactiveThumbColor: Colors.grey,
                            activeTrackColor: ColorResource.primaryColor,
                            activeThumbImage:
                                const AssetImage(ImageResource.check),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorResource.lightGrey),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                      child: Text(
                        'Support',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorResource.lightGrey),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Logout',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return const LogoutSheet();
                                    });
                              },
                              icon: const Icon(Icons.logout))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Version 8.2.12',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  dealerDetails() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorResource.lightGrey2)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dealer Details',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: ColorResource.lightGrey2,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(ImageResource.ev),
                Row(
                  children: [
                    Image.asset(ImageResource.cmnt),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(ImageResource.call),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            buildDetails('Name', 'Prama', 'Mobile No.', '9876543210',
                'Designation', 'Manager', 'Email ID', 'arunr@gmail.com'),
            const SizedBox(
              height: 10,
            ),
            buildDetailText(
                'Address', '4140 Parker Rd. Allentown, New Mexico 31134')
          ],
        ),
      ),
    );
  }
}

Widget buildDetails(String label1, String value1, String label2, String value2,
    String label3, String value3, String label4, String value4) {
  return Row(
    children: [
      Expanded(child: _buildDetailColumn(label1, value1, label2, value2)),
      Expanded(child: _buildDetailColumn(label3, value3, label4, value4)),
    ],
  );
}

Widget _buildDetailColumn(
    String label1, String value1, String label2, String value2) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildDetailText(label1, value1),
      const SizedBox(height: 10),
      buildDetailText(label2, value2),
    ],
  );
}

Widget buildDetailText(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ColorResource.lightGrey3,
          fontFamily: 'Inter',
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: ColorResource.black1,
          fontFamily: 'Inter',
        ),
      ),
    ],
  );
}
