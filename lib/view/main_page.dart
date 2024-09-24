import 'package:flutter/material.dart';
import 'package:login_page/view/dados_cadastrais.dart';
import 'package:login_page/view/pageBlue.dart';
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
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        width: double.infinity,
                        child: const Text("dados cadastrais")),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cadastro()
                              )
                              );
                    }
                    ),
                const SizedBox(height: 10),
                const Divider(),
                InkWell(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        width: double.infinity,
                        child: const Text("termos de uso e privacidade")),
                    onTap: () {}),
                const SizedBox(height: 10),
                const Divider(),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      width: double.infinity,
                      child: const Text("configurações")),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
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
                children: const [
                  PageBlue(),
                  PageYelllow(),
                  PagePink(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: pagePosition,
              items: const [
                BottomNavigationBarItem(
                  label: "pag1", icon: Icon(Icons.home)),
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
