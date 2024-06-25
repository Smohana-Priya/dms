import 'package:flutter/material.dart';

import '../utils/color_resources.dart';

class BasicInfoCard extends StatefulWidget {
  const BasicInfoCard({super.key});

  @override
  State<BasicInfoCard> createState() => _BasicInfoCardState();
}

class _BasicInfoCardState extends State<BasicInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorResource.lightGrey2, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Basic Information',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                color: ColorResource.lightGrey2,
              ),
              const SizedBox(
                height: 5,
              ),
              info('Model', 'Sniper 5G', 'Varient', 'STD'),
              const SizedBox(
                height: 13,
              ),
              info('MFT.Year', '2020', 'Color Type', 'Blue'),
              const SizedBox(
                height: 13,
              ),
              info('Subsidy', 'N/A', 'HSN Code', '5678'),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Motor Details',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const Divider(
                color: ColorResource.lightGrey2,
              ),
              const SizedBox(
                height: 5,
              ),
              info('Motor No', 'M-1234567', 'Motor', 'Tvs Locas'),
              const SizedBox(
                height: 13,
              ),
              info('Motor type', 'Hub Motor', 'Motor Range', '23000W'),
              const SizedBox(
                height: 13,
              ),
              info('Warranty', '02 Years', 'Expiry At', '1/06/2024'),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Motor Details',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const Divider(
                color: ColorResource.lightGrey2,
              ),
              const SizedBox(
                height: 5,
              ),
              info('Motor No', 'M-1234567', 'Motor', 'Tvs Locas'),
              const SizedBox(
                height: 13,
              ),
              info('Motor type', 'Hub Motor', 'Motor Range', '23000W'),
              const SizedBox(
                height: 13,
              ),
              info('Warranty', '02 Years', 'Expiry At', '1/06/2024'),
            ],
          ),
        ));
  }
}

info(String? title, String? subTitle, String? value, String? subValue) {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            Text(
              subTitle!,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value!,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            Text(
              subValue!,
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
