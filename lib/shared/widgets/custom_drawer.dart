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
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return const Wrap(children: [
                      ListTile(
                        title: Text('Câmera'),
                        leading: Icon(Icons.camera),
                      ),
                      ListTile(
                        title: Text('Galeria'),
                        leading: Icon(Icons.photo_album),
                      ),
                    ]);
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 133, 16, 242)),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png")),
                accountName: const Text("João Pedro"),
                accountEmail: const Text("jpedro@email.com")),
          ),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Dados cadastráis"),
                    ],
                  )),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cadastro()));
              }),
          const SizedBox(height: 10),
          const Divider(),
          InkWell(
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  width: double.infinity,
                  child: const Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(width: 5),
                      Text("termos de uso e privacidade"),
                    ],
                  )),
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    context: context,
                    builder: (BuildContext bc) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                        child: Column(
                          children: [
                            Text(
                              "termos de uso e privacidade",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "O pedaço padrão do Lorem Ipsum usado desde 1500 é reproduzido abaixo para os interessados. As seções 1.10.32 e 1.10.33 de de Finibus Bonorum et Malorum de Cícero também são reproduzidas em sua forma original exata, acompanhadas por versões em inglês da tradução de 1914 por H. Rackham.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      );
                    });
              }),
          const SizedBox(height: 10),
          const Divider(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.add_circle),
                    SizedBox(width: 5),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          const SizedBox(),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 5),
                    Text("Sair"),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return const AlertDialog(
                      title: Text("meu app"),
                      content: SizedBox(
                        child: Text("Deseja mesmo sair do aplicativo?"),
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
