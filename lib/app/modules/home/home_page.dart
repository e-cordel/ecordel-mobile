// import 'package:ecordel/app/share/models/cordel_summary_viewmodel.dart';
// import 'package:ecordel/app/share/widgets/ecordel_card_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'home_controller.dart';

// class HomePage extends StatefulWidget {
//   final String title;
//   const HomePage({Key? key, this.title = "Home"}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends ModularState<HomePage, HomeController> {
//   //use 'controller' variable to access controller

//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//     controller.refreshSummary().then((value) => null);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var size = MediaQuery.of(context).size;
//     // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
//     // final double itemWidth = size.width / 2;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: FutureBuilder(
//         future: controller.getSummary(),
//         builder: (_, AsyncSnapshot<List<CordelSummaryViewModel>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Um erro ocorreu ao obter os cordeis =('),
//             );
//           } else if (snapshot.hasData) {
//             return buildContent(snapshot.data!);
//           }
//           return Center(
//             child: Text('Um erro desconhecido ocorreu'),
//           );
//         },
//       ),
//     );
//   }

//   Container buildContent(List<CordelSummaryViewModel> cordelsSummary) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       child: GridView.count(
//         childAspectRatio: 0.6,
//         crossAxisCount: 2,
//         children: List.generate(
//           cordelsSummary.length,
//           (index) => CordelCard(
//             cordelSummary: cordelsSummary[index],
//           ),
//         ),
//       ),
//     );
//   }
// }
