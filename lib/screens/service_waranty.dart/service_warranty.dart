import 'package:dms_dealers/screens/service_waranty.dart/service.dart';
import 'package:dms_dealers/screens/service_waranty.dart/warranty.dart';
import 'package:dms_dealers/utils/color_resources.dart';
import 'package:dms_dealers/utils/image_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../drawer/drawer.dart';
import '../drawer/drawer_bloc.dart';

class ServiceWarranty extends StatefulWidget {
  const ServiceWarranty({super.key});

  @override
  State<ServiceWarranty> createState() => _ServiceWarrantyState();
}

class _ServiceWarrantyState extends State<ServiceWarranty> {
  String selectedValue = 'Snipper 5G';
  List<String> options = ['Snipper 5G', 'Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => DrawerBloc(),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Column(
              children: [
                Text(
                  'Service / Warranty',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
          body: DefaultTabController(
            length: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedValue,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.grey),
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: options
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TabBar(
                    tabs: const [
                      Tab(text: 'Service'),
                      Tab(
                        text: 'Warranty',
                      ),
                    ],
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        fontFamily: 'Inter'),
                    indicator: BoxDecoration(
                      color: ColorResource.primaryColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
              
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [Service(), Warranty()],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text(
              'Book Service',
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
            icon: const ImageIcon(
              AssetImage(
                ImageResource.book,
              ),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            backgroundColor: ColorResource.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}
