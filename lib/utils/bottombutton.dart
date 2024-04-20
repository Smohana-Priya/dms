import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'color_resources.dart';

class BottomButtonList extends StatefulWidget {
  const BottomButtonList({super.key});

  @override
  BottomButtonListState createState() => BottomButtonListState();
}

class BottomButtonListState extends State<BottomButtonList>
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: ColorResource.colorFFFFFF,
            border: Border(
              top: BorderSide(color: ColorResource.colorE4CDE1,),
            ),
          ),
          //color: ColorResource.colorFFFFFF,

          height: MediaQuery.of(context).size.height/10,
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.popAndPushNamed(
                      //     context, AppRoutes.dashboardScreen);
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/svg/home.svg'),
                        const SizedBox(height: 5,),
                        Text( 'HOME', style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(
                          fontSize: 14,
                          color: ColorResource.color8d9091,
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:  GestureDetector(
                    onTap: (){
                   //   showToast('Coming Soon');
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/svg/faq.svg'),
                        const SizedBox(height: 5,),
                        Text( 'FAQ',style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(
                          fontSize: 14,
                          color: ColorResource.color8d9091,
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:  GestureDetector(
                    onTap: (){
                      //showToast('Coming Soon');
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/svg/help.svg'),
                        const SizedBox(height: 5,),
                        Text( 'Help & Support',style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(
                          fontSize: 14,
                          color: ColorResource.color8d9091,
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
