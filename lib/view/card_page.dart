import 'package:flutter/material.dart';
import 'package:login_page/model/card_detail.dart';
import 'package:login_page/view/card_tatail_page.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  var cardDetail = CardDetail(
      1,
      "Meu Card",
      "https://static.vecteezy.com/system/resources/thumbnails/025/024/593/small/cute-penguin-isolated-on-transparent-background-ai-generated-digital-illustration-png.png",
      "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham");

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CardTatailPage(cardDetail: cardDetail)));
                },
                child: Card(
                  elevation: 7,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              cardDetail.url,
                            ),
                            Text(
                              cardDetail.title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Text(cardDetail.text),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Saiba mais",
                              style: TextStyle(
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
