import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TrackingDialog extends StatelessWidget {
  const TrackingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMediaQuery = MediaQuery.sizeOf(context).height;
    double widthMediaQuery = MediaQuery.sizeOf(context).width;
    return Container(
      height: heightMediaQuery * 0.5,
      width: widthMediaQuery * 0.8,
      child: Column(children: [
        SizedBox(
          height: heightMediaQuery * 0.01,
        ),
        Container(
          height: heightMediaQuery * 0.22,
          width: widthMediaQuery * 0.75,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage(
                      "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif"),
                  fit: BoxFit.fill)),
        ),
        SizedBox(
          height: heightMediaQuery * 0.01,
        ),
        const AutoSizeText(
          'Records Time',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: heightMediaQuery * 0.02,
        ),
        const AutoSizeText(
          'Cas is a beautiful environment .Cas is a best PlateForm.',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: heightMediaQuery * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
              onPressed: () => Navigator.pop(context, 'CANCEL'),
              child: const AutoSizeText('CANCEL'),
            ),
            SizedBox(
              width: widthMediaQuery * 0.1,
            ),
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const AutoSizeText('OK'),
            ),
            SizedBox(
              width: widthMediaQuery * 0.08,
            ),
          ],
        )
      ]),
    );
  }
}
