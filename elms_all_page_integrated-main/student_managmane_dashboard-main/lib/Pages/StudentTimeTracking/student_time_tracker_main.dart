import 'package:animate_do/animate_do.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'package:student_managmane_dashboard/Pages/StudentTimeTracking/tracking_dialog.dart';
import 'student_time_tracker_widget.dart';

class TimeTrackerPage extends StatefulWidget {
  const TimeTrackerPage({super.key});
  static const String name = "timeTracker";

  @override
  State<TimeTrackerPage> createState() => _TimeTrackerPageState();
}

class _TimeTrackerPageState extends State<TimeTrackerPage>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> offset;
  late AnimationController controller;

  // ** List of text
  List<ModelClass> text = [
    ModelClass(weekend: "Today", record: "No Record"),
    ModelClass(weekend: "Yesterday", record: "No Record"),
    ModelClass(weekend: "Monday", record: "No Record"),
    ModelClass(weekend: "Tuesday", record: "No Record"),
    ModelClass(weekend: "Wednesday", record: "No Record"),
    ModelClass(weekend: "Friday", record: "No Record"),
    ModelClass(weekend: "Friday", record: "No Record"),
  ];
  @override
  void initState() {
    // Todo: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              controller.forward();
            }
          });
    offset = Tween(begin: const Offset(0.0, 0.1), end: const Offset(0.0, 0.2))
        .animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    // Todo: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.sizeOf(context).height;
    var widthMediaQuery = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        children: [
          /// First Container Phase
          const AnimateContainer(),
          // Second Working phase
          Expanded(
            child: FadeInUp(
              duration: const Duration(seconds: 1),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: GridView.builder(
                  itemCount: text.length,
                  padding: const EdgeInsets.only(bottom: 50, top: 10),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) {
                    return SlideTransition(
                      position: offset,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const Dialog(child: TrackingDialog());
                            },
                          );
                        },
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            depth: -10,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(20)),
                            shadowLightColorEmboss:
                                const Color.fromARGB(255, 230, 230, 230),
                            shadowDarkColorEmboss:
                                const Color.fromARGB(255, 51, 51, 51),
                          ),
                          child: Container(
                            height: heightMediaQuery * 0.2,
                            width: widthMediaQuery * 0.3,
                            decoration: decoration(),
                            child: Center(
                                child: ContainerText(
                              recordText: text[index].record.toString(),
                              weekendText: text[index].weekend.toString(),
                            )),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ** Using Model Class
class ModelClass {
  String? weekend;
  String? record;

  ModelClass({this.weekend, this.record});
}
