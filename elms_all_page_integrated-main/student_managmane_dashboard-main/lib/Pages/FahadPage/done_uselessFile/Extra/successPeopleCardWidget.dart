// import 'package:flutter/material.dart';
// import 'package:glassmorphism/glassmorphism.dart';
// import 'package:student_managment_app_screens/screens/practice.dart';
// // import 'package:student_managment_app_screens/holder.dart';

// typedef LinkDinTapClickBack = void Function();

// class SuccessPeopleCards extends StatefulWidget {
//   const SuccessPeopleCards(
//       {required this.name,
//       required this.currentPosition,
//       required this.company,
//       required this.imageUrl,
//       required this.onTap,
//       super.key});

//   final String imageUrl;
//   final String name;
//   final String company;
//   final String currentPosition;
//   final LinkDinTapClickBack onTap;

//   @override
//   State<SuccessPeopleCards> createState() => _SuccessPeopleCardsState();
// }

// class _SuccessPeopleCardsState extends State<SuccessPeopleCards> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     onTap() {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('LinkDin Not Available')));
//     }

//     return InkWell(
//       onDoubleTap: () {
//         Navigator.push(context, PageRouteBuilder(
//           pageBuilder: (context, animation, secondaryAnimation) {
//             return PracticePage();
//           },
//         ));
//       },
//       child: Container(
//         // height: height * 0.5,
//         // width: width * 0,
//         decoration: BoxDecoration(
//             color: Colors.black,
//             boxShadow: const [
//               BoxShadow(
//                   color: Colors.white60,
//                   offset: Offset(1, 1),
//                   blurRadius: 2,
//                   spreadRadius: 2),
//               BoxShadow(
//                   color: Colors.white70,
//                   offset: Offset(-1, -1),
//                   blurRadius: 2,
//                   spreadRadius: 2)
//             ],

//             // IMAGE IN CONTAINER
//             image: DecorationImage(
//                 image: AssetImage(widget.imageUrl), fit: BoxFit.cover)),

//         // GLASSMORPHIC CONTAINER ON IMAGE
//         child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
//           GlassmorphicContainer(
//             // alignment: Alignment.bottomCenter,
//             width: width * 0.35,
//             height: (height * 0.35) * 0.3,
//             borderRadius: 0,
//             linearGradient: const LinearGradient(colors: [
//               Colors.white60,
//               Colors.white38,
//               Colors.white12,
//               Colors.white38,
//               Colors.white60,
//             ]),
//             border: 0,
//             blur: 1,
//             borderGradient: const LinearGradient(
//               colors: [
//                 Colors.black38,
//                 Colors.black38,
//                 Colors.black38,
//                 // Color.fromARGB(20, 0, 0, 0),
//                 // Color.fromARGB(33, 255, 255, 255),
//               ],
//             ),
//             // COLUMB IN GLASSMARPHIC CONTAINER
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 // PERSON NAME TEXT
//                 SizedBox(
//                     height: ((height * 0.35) * 0.3) * 0.25,
//                     child: FittedBox(
//                         child: Text(
//                       widget.name,
//                       style: TextStyle(
//                           color: Colors.white,
//                           // color: Colors,
//                           fontWeight: FontWeight.w600,
//                           shadows: [
//                             BoxShadow(
//                                 offset: Offset(1, 1), color: Colors.black38)
//                           ]),
//                     ))),

//                 // CURRENT POSION TEXT
//                 SizedBox(
//                     height: ((height * 0.35) * 0.3) * 0.18,
//                     child: FittedBox(
//                         // fit: BoxFit.scaleDown,
//                         child: Text(
//                       // maxLines: 2,
//                       widget.currentPosition,
//                       style: TextStyle(color: Colors.white, shadows: [
//                         BoxShadow(offset: Offset(1, 1), color: Colors.black38)
//                       ]),
//                     ))),

//                 // COMPANY NAME TEXT
//                 SizedBox(
//                     height: ((height * 0.35) * 0.3) * 0.2,
//                     child: FittedBox(
//                         child: Text(
//                       widget.company,
//                       style: TextStyle(color: Colors.white, shadows: [
//                         BoxShadow(offset: Offset(1, 1), color: Colors.black38)
//                       ]),
//                     ))),

//                 // LINKDIN BUTTON CONTAINER

//                 GestureDetector(
//                   //
//                   onTap: onTap,
//                   //
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       width: (width * 0.35) * 0.5,
//                       height: ((height * 0.35) * 0.3) * 0.2,
//                       // color: Colors.amber,

//                       // ROW IN CONTAINER
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // ICON IN BTN CONTAINER
//                           FittedBox(
//                             child: Icon(
//                               Icons.link_outlined,
//                               color: Colors.purple,
//                             ),
//                           ),

//                           // TEXT IN BTN CONTAINER
//                           FittedBox(
//                             child: Text(
//                               'Linkdin',
//                               style: TextStyle(
//                                   color: Colors.purple,
//                                   decoration: TextDecoration.underline),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
