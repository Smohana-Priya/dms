import 'package:dms_dealers/screens/service_waranty.dart/booked_service_card.dart';
import 'package:dms_dealers/screens/service_waranty.dart/service_card.dart';
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const BookedServiceCard(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, index) {
                return ServiceCard(
                  serviceNumber: '05 Service',
                  serviceId: 'S-ID : 000005',
                  date: '06 May 2023',
                  status: 'Completed',
                  statusColor: Colors.green,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
