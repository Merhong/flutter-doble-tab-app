import 'package:flutter/material.dart';
import 'package:flutter_double_tab_app/color_schemes.g.dart';

/// Flutter code sample for [TabBar].

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
      home: DoubleTabbar(),
    );
  }
}

class DoubleTabbar extends StatefulWidget {
  DoubleTabbar({Key? key}) : super(key: key);

  @override
  State<DoubleTabbar> createState() => _DoubleTabbarState();
}

class _DoubleTabbarState extends State<DoubleTabbar>
    with TickerProviderStateMixin {
  int tabNumber = 1;
  late TabController _tabController1;
  late TabController _tabController2;

  @override
  void initState() {
    super.initState();
    _tabController1 = TabController(length: 3, vsync: this);
    _tabController2 = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter TabBar Example ${tabNumber}')),
      body: Column(
        children: [
          _tabbar1(),
          _tabbar2(),
          Expanded(
            child: Stack(
              children: [
                if (tabNumber == 1) _view1(),
                if (tabNumber == 2) _view2()
              ],
            ),
          ),
        ],
      ),
    );}

  TabBar _tabbar1() {
    return TabBar(
      onTap: (v) {
        setState(() {
          tabNumber = 1;
        });
      },
      controller: _tabController1,
      // labelColor: Colors.brown, // 라벨의 색상 지정
      tabs: [
        Tab(icon: Icon(Icons.home), text: 'Home'),
        Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
        Tab(icon: Icon(Icons.settings), text: 'Settings'),
      ],
    );
  }

  TabBar _tabbar2() {
    return TabBar(
      onTap: (v) {
        setState(() {
          tabNumber = 2;
        });
      },
      controller: _tabController2,
      labelColor: lightColorScheme.secondary, // 라벨의 색상 지정
      tabs: [
        Tab(icon: Icon(Icons.home), text: 'Home2'),
        Tab(icon: Icon(Icons.favorite), text: 'Favorites2'),
        Tab(icon: Icon(Icons.settings), text: 'Settings2'),
      ],
    );
  }

  TabBarView _view1() {
    return TabBarView(
      controller: _tabController1,
      children: [
        Center(child: Text('Home 내용')),
        Center(child: Text('Favorites 내용')),
        Center(child: Text('Settings 내용')),
      ],
    );
  }

  TabBarView _view2() {
    return TabBarView(
      controller: _tabController2,
      children: [
        Center(child: Text('Home2 내용')),
        Center(child: Text('Favorites2 내용')),
        Center(child: Text('Settings2 내용')),
      ],
    );
  }
}
