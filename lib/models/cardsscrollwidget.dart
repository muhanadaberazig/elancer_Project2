import 'dart:math';

import 'package:elancer_api/screens/category_screen_final.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 10.0;
  var verticalInset = 11.0;
  List<String> list;
  CardScrollWidget({this.currentPage, required this.list});

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = [];

        for (var i = 0; i < list.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: <Widget>[
                      Image.network(list[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[i],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                    )),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                    color: HexColor('#36596A'),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: const Text("Read Later",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}