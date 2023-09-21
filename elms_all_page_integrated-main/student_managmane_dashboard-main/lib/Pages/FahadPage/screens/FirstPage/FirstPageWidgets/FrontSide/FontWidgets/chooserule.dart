import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/FahadPage/screens/CasianCoursesPage/courses_offer.dart';
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
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 25, right: 25),
      scrollDirection: Axis.horizontal,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          // Inner Part
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1st Container
                rotate
                    ? InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Button is Clicked')));
                        },
                        child: rightContainer(
                            rotate: -0.25,
                            right: 100,
                            height: height * 0.3,
                            width: width * 0.4,
                            color: Colors.blue,
                            btnText: 'Admin',
                            fun: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Admin Selected')));
                            }))
                    : Transform.rotate(
                        angle: -0.25,
                        child: Card(
                          elevation: 6,
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            curve: Curves.fastOutSlowIn,
                            height: height * 0.25,
                            width: width * 0.27,
                            decoration: decoration(Colors.blue),
                          ),
                        ),
                      ),
                //  2nd Container
                rotate
                    ? rightContainer(
                        rotate: 0.25,
                        left: 50,
                        height: height * 0.3,
                        width: width * 0.4,
                        color: Colors.red,
                        btnText: 'Super Admin',
                        fun: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Super Admin Selected')));
                        })
                    : Transform.rotate(
                        angle: 0.25,
                        child: Card(
                            elevation: 6,
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 2),
                              curve: Curves.fastOutSlowIn,
                              height: height * 0.25,
                              width: width * 0.27,
                              decoration: decoration(Colors.red),
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
            child: Card(
              elevation: 8,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                height: height * 0.33,
                width: width * 0.48,
                decoration: decoration(Colors.amber),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return LoginPage();
                            },
                          ));
                        },
                        child: Text('Student')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Text('Click '),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget rightContainer({
  double left = 1,
  double right = 1,
  double? height,
  double? width,
  Color? color,
  double rotate = 1,
  required String btnText,
  required Function fun,
}) {
  return AnimatedPadding(
    duration: const Duration(seconds: 2),
    curve: Curves.fastOutSlowIn,
    padding: EdgeInsets.only(left: left, right: right),
    child: Transform.rotate(
      angle: rotate,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(seconds: 2),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: ElevatedButton(
            onPressed: () {
              return fun.call();
            },
            child: Text(btnText)),
      ),
    ),
  );
}

class InnerContainer extends StatelessWidget {
  const InnerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: -0.3,
            child: Container(
              height: height * 0.25,
              width: width * 0.3,
              color: Colors.blue,
            ),
          ),
          Transform.rotate(
            angle: 0.3,
            child: Container(
              height: height * 0.25,
              width: width * 0.3,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration decoration(Color color) {
  return BoxDecoration(color: color, borderRadius: BorderRadius.circular(10));
}
