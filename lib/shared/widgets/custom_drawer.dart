import 'package:flutter/material.dart';
import 'package:login_page/view/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         UserAccountsDrawerHeader(
          decoration:const  BoxDecoration(color: Color.fromARGB(255, 133, 16, 242)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.network("https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.deviantart.com%2Fnoe3210%2Fart%2FAnakin-Skywalker-Icon-955629441&psig=AOvVaw1ZbrdVpi32HVSsE1Lf4UVK&ust=1727655751463000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCLiQi63x5ogDFQAAAAAdAAAAABAu")),
            accountName: const Text("João Pedro"),
             accountEmail:const  Text("jpedro@email.com")),
          InkWell(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  width: double.infinity,
                  child:const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 5,),
                      Text("Dados cadastráis"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Cadastro()));
              }),
          const SizedBox(height: 10),
          const Divider(),
          InkWell(
              child: Container(
                 padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(width: 5),
                      Text("termos de uso e privacidade"),
                    ],
                  )),
              onTap: () {}),
          const SizedBox(height: 10),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                width: double.infinity,
                child:const Row(
                  children: [
                    Icon(Icons.add_circle),
                    SizedBox(width: 5),
                    Text("configurações"),
                  ],
                )),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
