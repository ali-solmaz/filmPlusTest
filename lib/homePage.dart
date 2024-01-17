import 'package:filmplus/Widgets/HomeScreen/companents/MainWidget.dart';
import 'package:filmplus/Widgets/SearchScreen/searchPage.dart';
import 'package:filmplus/Widgets/HomeScreen/mainPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List pages = [const MainPage(),const SearchPage()];
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image(
              image: NetworkImage(
                  "https://koditips.com/wp-content/uploads/Filmplus-icon.png"),
              height: 80),
        ),
        bottomNavigationBar: NavigationBar(height: 60,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home",),
            NavigationDestination(icon: Icon(Icons.search), label: "Search")
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
        body: pages[selectedIndex],
      ),
    );
  }
}
