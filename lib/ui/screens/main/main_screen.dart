import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:krypto/ui/components/fab_button.dart';
import 'package:krypto/ui/screens/main/config_tab_screen.dart';
import 'package:krypto/ui/screens/main/pass_tab_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin<MainScreen> {
  List<AnimationController> _faders;
  AnimationController _hide;

  @override
  void initState() {
    super.initState();

    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    _hide.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                'Krypto',
                style: Theme.of(context).textTheme.headline6,
              ),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.textsms,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.settings_applications,
                      color: Theme.of(context).accentColor,
                    ),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                PassTabScreen(),
                ConfigTabScreen(),
              ],
            ),
            floatingActionButton: FabButton(),
          ),
        ),
      ),
    );
  }
}
