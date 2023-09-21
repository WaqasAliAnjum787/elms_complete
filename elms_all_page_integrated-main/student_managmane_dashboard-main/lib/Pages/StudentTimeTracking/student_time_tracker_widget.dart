
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class AnimateContainer extends StatelessWidget {
  const AnimateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.sizeOf(context).height;
    var widthMediaQuery = MediaQuery.sizeOf(context).width;
    return FadeInDown(
      duration: const Duration(seconds: 1),
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: -10,
          boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
          shadowLightColorEmboss: const Color.fromARGB(255, 212, 212, 212),
          shadowDarkColorEmboss: const Color.fromARGB(255, 51, 51, 51),
        ),
        child: Container(
            height: heightMediaQuery * 0.35,
            width: widthMediaQuery,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                color: Color.fromARGB(255, 0, 151, 191)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.abc)),
                  const AnimatedUpperText(),
                  const AnimatedDownText(),
                ],
              ),
            )),
      ),
    );
  }
}

class AnimatedUpperText extends StatelessWidget {
  const AnimatedUpperText({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 32.0,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('WORKING TIME',
                textAlign: TextAlign.center,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 3)]),
                speed: const Duration(milliseconds: 200),
                cursor: ""),
          ],
          // isRepeatingAnimation: true,
          repeatForever: true,
          totalRepeatCount: 2,
          isRepeatingAnimation: false,
          onTap: () {
            debugPrint("Tap Event");
          },
        ),
      ),
    );
  }
}

class AnimatedDownText extends StatelessWidget {
  const AnimatedDownText({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 32.0,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('TRACKER',
                textAlign: TextAlign.center,
                speed: const Duration(milliseconds: 300),
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black, blurRadius: 3)]),
                cursor: ""),
          ],
          // isRepeatingAnimation: true,
          repeatForever: true,
          totalRepeatCount: 0,
          onTap: () {
            debugPrint("Tap Event");
          },
        ),
      ),
    );
  }
}

class ContainerText extends StatelessWidget {
  const ContainerText(
      {super.key, required this.weekendText, required this.recordText});
  final String weekendText;
  final String recordText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            weekendText,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [BoxShadow(color: Colors.black, blurRadius: 3)]),
          ),
          AutoSizeText(
            recordText,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// ** Common BoxDecoration .
BoxDecoration decoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: const Color.fromARGB(255, 38, 64, 125),
    gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 0, 157, 190),
          Color.fromARGB(255, 0, 165, 194),
        ],
        begin: Alignment.topCenter,
        end: Alignment.center,
        stops: [0.5, 1.0]),
  );
}
