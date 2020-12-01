// import 'package:ecordel/app/commons/models/ecordel.dart';
// import 'package:ecordel/app/commons/providers/cordel_provider.dart';

// import 'components/ecordel_card_widget.dart';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomeBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       color: Colors.orange[50],
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(padding: EdgeInsets.only(top: 90)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Icon(
//                 Icons.local_library,
//                 size: 25,
//                 color: Colors.black45,
//               ),
//               Padding(padding: EdgeInsets.all(6)),
//               Text(
//                 "Mais lidos",
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 25,
//                 ),
//               ),
//             ],
//           ),
//           Consumer<EcordelProvider>(
//             builder: (context, provider, _) {
//               var cordeis = provider.getAll();
//               if (cordeis.length >= 0) {
//                 return Container(
//                   height: 230,
//                   width: screenSize.size.width,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 5,
//                     itemBuilder: (context, index) {
//                       return CordelCard(
//                         cordel: cordeis[index],
//                       );
//                     },
//                   ),
//                 );
//               } else {
//                 return Center(
//                   child: Container(),
//                 );
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
