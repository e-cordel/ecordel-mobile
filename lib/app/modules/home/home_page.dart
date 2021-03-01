import 'package:ecordel/app/share/widgets/ecordel_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller.refreshSummary().then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Observer(builder: (_) {
          var cordelsSummary = controller.cordelsSummary;
          return controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.count(
                    childAspectRatio: 0.6,
                    crossAxisCount: 2,
                    children: List.generate(
                      cordelsSummary.length,
                      (index) => CordelCard(
                        cordelSummary: cordelsSummary[index],
                      ),
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
