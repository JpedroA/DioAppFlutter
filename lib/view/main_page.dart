import 'package:flutter/material.dart';
import 'package:login_page/shared/widgets/custom_drawer.dart';
import 'package:login_page/view/card_page.dart';
import 'package:login_page/view/pagePink.dart';
import 'package:login_page/view/pageYellow.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pagePosition = 0;
  PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Home")),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    pagePosition = value;
                  });
                },
                children:  [
                  CardPage(),
                  const PageYelllow(),
                  const PagePink(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: pagePosition,
              items: const [
                BottomNavigationBarItem(label: "pag1", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "pag2", icon: Icon(Icons.camera)),
                BottomNavigationBarItem(
                    label: "pag3", icon: Icon(Icons.add_box))
              ],
            )
          ],
        ),
      ),
    );
  }
}
