import 'package:ecordel/app/commons/providers/cordel_provider.dart';
import 'package:ecordel/app/commons/models/cordel_summary.dart';
import 'package:ecordel/app/commons/utils/ecordel_from_summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/cordel_search_delegate.dart';
import 'components/ecordel_card_widget.dart';
import 'components/notification_icon_widget.dart';
import 'components/section_category.dart';

class HomeScreen extends StatefulWidget {
  static String route = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screenSize;
  bool _firstBuild = true;
  bool _isLoading = true;
  bool _errorOnFech = false;
  List<CordelSummary> _cordelSummary;

  @override
  void didChangeDependencies() {
    if (_firstBuild) {
      Provider.of<EcordelProvider>(context, listen: false)
          .getCordelSumary()
          .then((summary) {
        setState(() {
          _cordelSummary = summary;
          this.screenSize = MediaQuery.of(context);
          _isLoading = false;
          _firstBuild = false;
        });
      }).catchError((error) {
        setState(() {
          _errorOnFech = true;
          _isLoading = false;
          _firstBuild = false;
        });
      });
      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _errorOnFech
                ? Container(
                    color: Colors.orange[50],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Um erro ocorreu ao tentar obter os dados =(',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  )
                : _buildBody(),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        color: Colors.grey,
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          color: Colors.grey,
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: EcordelSearch());
          },
        ),
        NotificationButtonWidget(),
      ],
      elevation: 14,
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        color: Colors.orange[50],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionCategory(
              sectionName: 'Mais lidos',
            ),
            _buildCards()
          ],
        ),
      ),
    );
  }

  Widget _buildCards() {
    if (this._cordelSummary.length > 0) {
      return Container(
        height: 230,
        width: screenSize.size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _cordelSummary.length,
          itemBuilder: (context, index) {
            return CordelCard(
                cordel: castToCordelFromSummary(_cordelSummary[index]));
          },
        ),
      );
    } else {
      return Center(
        child: Text('Ainda não há cordel nesta categoria'),
      );
    }
  }
}
