// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:scan/scan.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ScanWindow extends StatefulWidget {
//   @override
//   _ScanWindowState createState() => _ScanWindowState();
// }
//
// class _ScanWindowState extends State<ScanWindow> {
//
//   final ImagePicker _picker = ImagePicker();
//   final TextEditingController maxWidthController = TextEditingController();
//   final TextEditingController maxHeightController = TextEditingController();
//   final TextEditingController qualityController = TextEditingController();
//
//   String _platformVersion = 'Unknown';
//
//   ScanController controller = ScanController();
//
//   String qrcode = 'Unknown';
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }
//
//   Future<void> initPlatformState() async {
//     String platformVersion;
//     try {
//       platformVersion = await Scan.platformVersion;
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }
//     if (!mounted) return;
//
//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final fullW = MediaQuery.of(context).size.width * 1.00;
//     final fullH = MediaQuery.of(context).size.height * 1.00;
//     return Container(
//       width: fullW,
//       height: fullH,
//       child: Column(
//         children: [
//           Text('Running on: $_platformVersion\n'),
//           Wrap(
//             children: [
//               ElevatedButton(
//                 child: Text("toggleTorchMode"),
//                 onPressed: () {
//                   controller.toggleTorchMode();
//                 },
//               ),
//               ElevatedButton(
//                 child: Text("pause"),
//                 onPressed: () {
//                   controller.pause();
//                 },
//               ),
//               ElevatedButton(
//                 child: Text("resume"),
//                 onPressed: () {
//                   controller.resume();
//                 },
//               ),
//               ElevatedButton(
//                 child: Text("parse from image"),
//                 onPressed: () async {
//                  // List<Media> res = await ImagePicker.platform();
//                  //  if (res != null) {
//                  //    String str = await Scan.parse(res[0].path);
//                  //    if (str != null) {
//                  //      setState(() {
//                  //        qrcode = str;
//                  //      });
//                  //    }
//                  //  }
//
//                   try {
//                     final res = await _picker.getImage(
//
//                     );
//                     setState(() {
//                       qrcode = res.toString();
//                     });
//                   } catch (e) {
//                     print(e);
//                   }
//
//                 },
//               ),
//             ],
//           ),
//           Container(
//             width: 220,
//             height: 400,
//             child: ScanView(
//               controller: controller,
//               scanAreaScale: .7,
//               scanLineColor: Colors.green.shade400,
//               onCapture: (data) {
//                 setState(() {
//                   qrcode = data;
//                 });
//               },
//             ),
//           ),
//           Text('scan result is $qrcode'),
//         ],
//       ),
//     );
//   }
//
// }
