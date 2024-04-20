import 'package:flutter/material.dart';
import 'color_resources.dart';
import 'image_resources.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({super.key});

  @override
  DrawerListState createState() => DrawerListState();
}

class DrawerListState extends State<DrawerList>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width/3,
        child: Drawer(
          child: Stack(
            children: [
              Container(
                color: ColorResource.colorFFFFFF,
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: ColorResource.colorFFFFFF,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: ColorResource.color000000,
                                  width: 2,
                                )
                            ),
                            child: const Center(child: Icon(Icons.cancel)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(thickness: 2,),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async{

                        },
                        child: Column(
                          children: [
                            Image.asset(ImageResource.homes,scale: 2,),
                            const SizedBox(height:5),
                            Text('Home',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  fontSize: 18,
                                  color: ColorResource.color707070,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async{
                        },
                        child: Column(
                          children: [
                            Image.asset(ImageResource.imagePro,scale: 2,),
                            const SizedBox(height:5),
                            Text('Image \nProcessing',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  fontSize: 18,
                                  color: ColorResource.color707070,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async{
                        },
                        child: Column(
                          children: [
                            Image.asset(ImageResource.videoPro,scale: 2,),
                            const SizedBox(height:5),
                            Text('Video \nProcessing',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  fontSize: 18,
                                  color: ColorResource.color707070,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: ()async {

                        },
                        child:Column(
                          children: [
                            Image.asset(ImageResource.apiPro,scale: 2,),
                            const SizedBox(height:5),
                            Text('External \n${"Api's"}',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  fontSize: 18,
                                  color: ColorResource.color707070,
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: ()async{

                        },
                        child: Column(
                          children: [
                            Image.asset(ImageResource.facePro,scale: 2,),
                            const SizedBox(height:5),
                            Text('Facial \n Recognition',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  fontSize: 18,
                                  color: ColorResource.color707070,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
