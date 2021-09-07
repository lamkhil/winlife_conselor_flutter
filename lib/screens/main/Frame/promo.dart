import 'package:flutter/material.dart';
import 'package:winlife_conselor_flutter/constant/color.dart';

class FramePromo extends StatefulWidget {
  const FramePromo({Key? key}) : super(key: key);

  @override
  _FramePromoState createState() => _FramePromoState();
}

class _FramePromoState extends State<FramePromo> {
  Future<void> _refresh() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Promo",
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontFamily: 'neosansbold', color: Colors.black87),
            ),
          ),
        ),
        body: SafeArea(
            child: RefreshIndicator(
          onRefresh: _refresh,
          child: Container(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    exploreview("text"),
                    exploreview("text"),
                    exploreview("text"),
                    exploreview("text"),
                    exploreview("text"),
                    exploreview("text"),
                    exploreview("text"),
                  ],
                ),
              )),
        )));
  }

  Widget exploreview(text) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0.8,
              blurRadius: 8,
              offset: Offset(2, 6), // changes position of shadow
            ),
          ],
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 135,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
              child: Image.asset(
                "assets/promo-demo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(
                          "Buy 1 Get 1",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'neosansbold',
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          "valid",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'muli',
                              color: Colors.black87,
                              fontSize: 12),
                        ),
                        Text(
                          "12 Agst 2020 - 20 Agst 2021",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'muli',
                              color: Colors.black87,
                              fontSize: 12),
                        ),
                      ])),
                  Expanded(
                      child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0.8,
                                  blurRadius: 5,
                                  offset: Offset(
                                      2, 5), // changes position of shadow
                                ),
                              ],
                              color: mainColor,
                              border: Border.all(
                                color: mainColor,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Yes, I Want",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'neosansbold',
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )))
                ],
              ))
        ],
      ),
    );
  }
}
