import 'package:dms_dealers/screens/service_waranty.dart/service_card.dart';
import 'package:flutter/material.dart';

class Warranty extends StatelessWidget {
  const Warranty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, index) {
              return ServiceCard(
                serviceNumber: 'Motor',
                serviceId: 'S-ID : 000005',
                date: '06 May 2023',
                status: 'In Transit',
                statusColor: Colors.red,
              );
            },
          ),
        ),
      ],
    );
  }
}
