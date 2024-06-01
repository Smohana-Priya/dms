import 'package:dms_dealers/screens/drawer/drawer.dart';
import 'package:dms_dealers/screens/drawer/drawer_bloc.dart';
import 'package:dms_dealers/utils/contants.dart';
import 'package:dms_dealers/utils/image_resources.dart';
import 'package:dms_dealers/widgets/basic_info_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/color_resources.dart';
import '../../widgets/invoice_card.dart';
import '../../widgets/main_menu_card.dart';

class AboutVahicle extends StatelessWidget {
  const AboutVahicle({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => DrawerBloc(),
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                'About Vahicle',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              actions: [
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.notification_add),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(Icons.menu),
                    ),
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              width: MediaQuery.of(context).size.width * 0.85,
              child: const DmsDrawer(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorResource.lightGrey2, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const MainMenuCard(
                          img: ImageResource.vehicle1,
                          title: Constants.sniper,
                          subTitle: Constants.chissNo,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 16,
                      spacing: 16,
                      children: [
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
                                Image.asset(ImageResource.build),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '05',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'No of services',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ])
                              ],
                            ),
                          ),
                        ),
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
                                Image.asset(ImageResource.warranty),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '01',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        'Warranty Claim',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            color: Colors.black,
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
                      height: 10,
                    ),
                    const InvoiceCard(),
                    const SizedBox(
                      height: 10,
                    ),
                    const BasicInfoCard(),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
