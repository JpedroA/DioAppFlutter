import 'package:login_page/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 2));
    return CardDetail(
       1,
      "Meu Card",
      "https://static.vecteezy.com/system/resources/thumbnails/025/024/593/small/cute-penguin-isolated-on-transparent-background-ai-generated-digital-illustration-png.png",
      "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham");
  }
}
