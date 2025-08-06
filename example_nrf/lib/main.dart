import 'package:example_nrf/pages/device_page.dart';
import 'package:example_nrf/pages/group_page.dart';
import 'package:example_nrf/pages/scene_page.dart';
import 'package:flutter/material.dart';


void main() async {
  // Obtain shared preferences.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var _position = 0;
  final iconsMap = {
    //底栏图标
    "Devices": Icons.devices, "Groups": Icons.group_work,
    "Scenes": Icons.add_alarm, "Setting": Icons.settings,
  };
  final _colors = [Colors.blue];
  late PageController _controller; //页面控制器，初始0

  @override
  void initState() {
    _controller = PageController(initialPage: _position);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: PageView(
        controller: _controller,
        children: [
          _buildDevicePage(),
          _buildGroupPage(),
          _buildScenePage(),
          _buildSettingPage(),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (position) {
        _controller.jumpToPage(position);
        setState(() => _position = position);
      },
      currentIndex: _position,
      elevation: 1,
      type: BottomNavigationBarType.shifting,
      fixedColor: Colors.white,
      iconSize: 25,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      showUnselectedLabels: false,
      showSelectedLabels: true,
      items: iconsMap.keys
          .map(
            (key) => BottomNavigationBarItem(
              label: key,
              icon: Icon(iconsMap[key]),
              backgroundColor: Colors.blue,
            ),
          )
          .toList(),
    );
  }

  Widget _buildDevicePage() => DevicePage();

  Widget _buildGroupPage() => GroupPage();

  Widget _buildScenePage() => ScenePage();

  Widget _buildSettingPage() => SizedBox();
}
