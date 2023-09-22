import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:student_managmane_dashboard/Pages/login_page/module/home/presentation/home_screen.dart';

class CarousalAnimation extends StatefulWidget {
  const CarousalAnimation({super.key});

  @override
  State<CarousalAnimation> createState() => _CarousalAnimationState();
}

class _CarousalAnimationState extends State<CarousalAnimation> {
  bool rotate = false;

  @override
  Widget build(BuildContext context) {
    debugPrint("ReBuild");
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
            right: width * 0.15, left: width * 0.15, bottom: height * 0.03),
        // padding: EdgeInsets.all(width * 0.15),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.horizontal,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Inner Part .
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1st Container
                  Transform.rotate(
                    angle: rotate ? -0.5 : -0.25,
                    alignment: rotate
                        ? const Alignment(0.0, 0.8)
                        : const Alignment(0.0, 0.0),
                    child: Card(
                      elevation: 3,
                      child: InkWell(
                        onTap: () => print("1st Container"),
                        child: neumorphicDesign(
                          child: AnimatedContainer(
                            padding: EdgeInsets.only(right: rotate ? 50 : 0),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.fastOutSlowIn,
                            height: rotate ? height * 0.3 : height * 0.25,
                            width: rotate ? width * 0.4 : width * 0.27,
                            decoration: decoration(Colors.blue),
                            child: ContainerInnerColum(
                                messageText: "ADMIN",
                                left: 30,
                                textAlignment: rotate
                                    ? Alignment.bottomCenter
                                    : Alignment.topRight,
                                fontSize: rotate ? 25 : 0,
                                images: "assets/images/admin.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //  2nd Container
                  Transform.rotate(
                      angle: rotate ? 0.5 : 0.25,
                      alignment: rotate
                          ? const Alignment(0.0, 0.8)
                          : const Alignment(0.0, 0.0),
                      child: Card(
                          elevation: 3,
                          child: InkWell(
                            onTap: () => print("2nd Container"),
                            child: neumorphicDesign(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.fastOutSlowIn,
                                height: rotate ? height * 0.3 : height * 0.25,
                                width: rotate ? width * 0.4 : width * 0.27,
                                decoration: decoration(Colors.red),
                                child: ContainerInnerColum(
                                    messageText: "SUPER ADMIN",
                                    textAlignment: rotate
                                        ? Alignment.bottomCenter
                                        : Alignment.topLeft,
                                    fontSize: rotate ? 25 : 0,
                                    images: "assets/images/superadmin.png"),
                              ),
                            ),
                          ))),
                ],
              ),
            ),

            //  Upper Part
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() => rotate = !rotate);
              },
              child: neumorphicDesign(
                child: Container(
                    // duration: const Duration(seconds: 2),
                    // curve: Curves.fastOutSlowIn,
                    height: height * 0.33,
                    width: width * 0.48,
                    decoration: decoration(Colors.amber),
                    child: Column(
                      children: [
                        const Expanded(
                          child: Center(
                            child: AutoSizeText(
                              "Student",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 25,
                                  shadows: [
                                    Shadow(color: Colors.black, blurRadius: 3)
                                  ],
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const Expanded(
                            flex: 2,
                            child: Image(
                                image:
                                    AssetImage("assets/images/student.png"))),
                        TextButton(
                            autofocus: true,
                            style: ButtonStyle(
                                shadowColor:
                                    const MaterialStatePropertyAll(Colors.pink),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.white.withOpacity(0.2))),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        LoginPage(),
                                  ));
                            },
                            child: SizedBox(
                              width: (width * 0.48) * 0.7,
                              child: const Text(
                                "Next",
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 10),
                              ),
                            ))
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Use this child of Container
class ContainerInnerColum extends StatelessWidget {
  const ContainerInnerColum(
      {super.key,
      this.images = "asset/images/staff.png",
      this.left = 1.0,
      required this.messageText,
      required this.fontSize,
      this.textAlignment = Alignment.topLeft});
  final String images;
  final double left;
  final String messageText;
  final double fontSize;
  final AlignmentGeometry textAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: textAlignment,
              child: AutoSizeText(
                messageText,
                style: TextStyle(
                    fontSize: fontSize,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: const [
                      Shadow(color: Colors.black, blurRadius: 4),
                    ]),
                maxLines: 1,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(left: left),
              child: Image(image: AssetImage(images)),
            ),
          ),
        ]);
  }
}

// Decorated Box
BoxDecoration decoration(Color color) {
  return BoxDecoration(color: color, borderRadius: BorderRadius.circular(10));
}

//  All Container Use this Neumorphic Design
// Needed : Please install this Package .
//    **   neumorphic_ui: ^1.0.1     ***
Widget neumorphicDesign({Widget? child}) {
  return Neumorphic(
    curve: Curves.bounceInOut,
    style: NeumorphicStyle(
        intensity: 0.6,
        depth: -10,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
        shadowLightColorEmboss: Colors.white.withOpacity(0.9),
        shadowDarkColorEmboss: const Color.fromARGB(193, 131, 131, 131),
        border: const NeumorphicBorder(color: Colors.black12, width: 1)),
    child: child,
  );
}
